import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/services/firebase_service.dart';
import 'package:event_planner/shared_components/models/user_profile_validations.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/route/app_router.dart';
import '../../../shared_components/models/user_profile.dart';
import '../../../shared_components/util/regex.dart';
import '../../../shared_components/widgets/snackbar.dart';
import '../../login/blocs/login_bloc.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileState.initial()) {
    on<ValidateFirstName>(_onValidateFirstName);
    on<ValidateLastName>(_onValidateLastName);
    on<ValidateEmail>(_onValidateEmail);
    on<ValidatePhoneNumber>(_onValidatePhoneNumber);
    on<ValidateMailingAddress>(_onValidateMailingAddress);
    on<PickAndUploadUserImage>(_onPickAndUploadUserImage);
    on<SaveUserProfile>(_onSaveUserProfile);
    on<GetUserProfile>(_onGetUserProfile);
    on<EditFieldsClickedToggle>(_onEditFieldsClickedToggle);
    on<SaveFCMToken>(_onSaveFCMToken);
  }

  Future<void> _onValidateFirstName(
      ValidateFirstName event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.userProfileValidations.firstNameErrorText.isNotEmpty){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(firstNameErrorText: '')));
    }
    if(!RegexValidator.isValidName(event.text)){
      emit(state.copyWith(userProfileValidations:
          state.userProfileValidations.copyWith(firstNameErrorText: Constants.invalidName)));
    }
    else{
      emit(state.copyWith(userProfile: state.userProfile.copyWith(firstName: event.text)));
    }
  }

  Future<void> _onValidateLastName(
      ValidateLastName event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.userProfileValidations.lastNameErrorText.isNotEmpty){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(lastNameErrorText: '')));
    }
    if(!RegexValidator.isValidName(event.text)){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(lastNameErrorText: Constants.invalidName)));
    }
    else{
      emit(state.copyWith(userProfile: state.userProfile.copyWith(lastName: event.text)));
    }
  }

  Future<void> _onValidateEmail(
      ValidateEmail event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.userProfileValidations.emailErrorText.isNotEmpty){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(emailErrorText: '')));
    }
    if(!RegexValidator.isValidEmail(event.text)){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(emailErrorText: Constants.invalidName)));
    }
    else{
      emit(state.copyWith(userProfile: state.userProfile.copyWith(email: event.text)));
    }
  }

  Future<void> _onValidatePhoneNumber(
      ValidatePhoneNumber event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.userProfileValidations.phoneNumberErrorText.isNotEmpty){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(phoneNumberErrorText: '')));
    }
    if(!RegexValidator.isValidContactNumber(event.text)){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(phoneNumberErrorText: Constants.invalidPhoneNumber)));
    }
    else{
      emit(state.copyWith(userProfile: state.userProfile.copyWith(phoneNumber: event.text)));
    }
  }

  Future<void> _onValidateMailingAddress(
      ValidateMailingAddress event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.userProfileValidations.mailingAddressErrorText.isNotEmpty){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(mailingAddressErrorText: '')));
    }
    if(!RegexValidator.isValidAddress(event.text)){
      emit(state.copyWith(userProfileValidations:
      state.userProfileValidations.copyWith(mailingAddressErrorText: Constants.invalidMailingAddress)));
    }
    else{
      emit(state.copyWith(userProfile: state.userProfile.copyWith(mailingAddress: event.text)));
    }
  }

  Future<void> _onPickAndUploadUserImage(
      PickAndUploadUserImage event,
      emit,
      ) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return; // User canceled image selection
    File file = File(image.path);
    emit(state.copyWith(isLoading: true));
    try {
      final downloadUrl = await FirebaseService.instance.uploadImage(file);
      emit(state.copyWith(userProfile:
      state.userProfile.copyWith(imageUrl: downloadUrl),isLoading: false));
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          AppSnackBar().showSnackBar(title: "Image upload Failed", subTitle: e.toString())
      );
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onSaveUserProfile(
      SaveUserProfile event,
      emit,
      ) async {
    try{
      emit(state.copyWith(isLoading: true));
      await FirebaseService.instance.saveUserDetails(
          state.userProfile
      );
      emit(state.copyWith(isLoading: false));
      appRouter.replaceAll([DashboardRoute()]);
    }
    catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          AppSnackBar().showSnackBar(title: "Profile Save Failed", subTitle: e.toString())
      );
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onGetUserProfile(
      GetUserProfile event,
      emit,
      ) async {
    try{
      UserProfile? userProfile = await FirebaseService.instance.getUserProfile();
      if(userProfile!=null){
        emit(state.copyWith(userProfile: userProfile));
      }
      else {
        appRouter.replaceAll([LoginRoute()]);
      }
    }catch(e){
      print("Error fetching user profile: $e");
      BlocProvider.of<LoginBloc>(Get.context!).add(UserLogout());
      appRouter.replaceAll([LoginRoute()]);
    }
  }
  Future<void> _onEditFieldsClickedToggle(
      EditFieldsClickedToggle event,
      emit,
      ) async {
    emit(state.copyWith(isEditFieldsClicked: !state.isEditFieldsClicked));
  }
  Future<void> _onSaveFCMToken(
      SaveFCMToken event,
      emit,
      ) async {
    try{
      await FirebaseService.instance.saveUserFCMToken(event.fcmToken);
    }catch(e){
      print("Error saving fcm token: $e");
    }

  }
}

