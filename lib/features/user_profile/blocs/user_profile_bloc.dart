import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_planner/services/firebase_service.dart';
import 'package:event_planner/shared_components/models/user_profile_validations.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';

import '../../../shared_components/models/user_profile.dart';
import '../../../shared_components/util/regex.dart';
import '../../../shared_components/util/snackbar.dart';
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
  }

  Future<void> _onPickAndUploadUserImage(
      PickAndUploadUserImage event,
      emit,
      ) async {
    // final picker = ImagePicker();
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    //
    // if (image == null) return; // User canceled image selection
    //
    // File file = File(image.path);
    //
    // try {
    //   final downloadUrl = await FirebaseService.instance.uploadImage(file);
    //   emit(state.copyWith(userProfile:
    //   state.userProfile.copyWith(imageUrl: downloadUrl)));
    // } catch (e) {
    //   ScaffoldMessenger.of(Get.context!).showSnackBar(
    //       AppSnackBar().showSnackBar(title: "Image upload Failed", subTitle: e.toString())
    //   );
    // }
  }
}
