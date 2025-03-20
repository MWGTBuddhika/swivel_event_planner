import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/app_router.dart';
import '../../../services/firebase_service.dart';
import '../../../shared_components/util/regex.dart';
import '../../../shared_components/widgets/snackbar.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignUpState> {
  SignupBloc() : super(SignUpState.initial()) {
    on<ValidateEmailInputs>(_onValidateEmailInputs);
    on<ValidatePasswordInputs>(_onValidatePasswordInputs);
    on<ValidateConfirmPasswordInputs>(_onValidateConfirmPasswordInputs);
    on<UserSignup>(_onUserSignup);
  }

  Future<void> _onValidateEmailInputs(
      ValidateEmailInputs event,
    emit,
  ) async {
    //clear any errors currently showing on
    if(state.emailErrorText.isNotEmpty){
      emit(state.copyWith(emailErrorText: ''));
    }
    if(!RegexValidator.isValidEmail(event.text)){
      emit(state.copyWith(emailErrorText: Constants.invalidEmail));
    }
    else{
      emit(state.copyWith(email: event.text));
    }
  }

  Future<void> _onValidatePasswordInputs(
      ValidatePasswordInputs event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.passwordErrorText.isNotEmpty){
      emit(state.copyWith(passwordErrorText: ''));
    }
    if(!RegexValidator.isValidPassword(event.text)){
      emit(state.copyWith(passwordErrorText: Constants.invalidPassword));
    }
    else{
      emit(state.copyWith(password: event.text));
    }
  }

  Future<void> _onValidateConfirmPasswordInputs(
      ValidateConfirmPasswordInputs event,
      emit,
      ) async {
    //clear any errors currently showing on
    if(state.confirmPasswordErrorText.isNotEmpty){
      emit(state.copyWith(confirmPasswordErrorText: ''));
    }
    if(!RegexValidator.isValidPassword(event.text)){
      emit(state.copyWith(confirmPasswordErrorText: Constants.invalidPassword));
    }
    else{
      emit(state.copyWith(confirmPassword: event.text));
    }
  }

  Future<void> _onUserSignup(
      UserSignup event,
      emit,
      ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final fbUser = await FirebaseService.instance.registerWithEmailAndPassword(
          state.email,
          state.password
      );
      emit(state.copyWith(isLoading: false));
      if(fbUser!=null){
        appRouter.replaceAll([ProfilePictureUploadRoute()]);
      }
    }
    catch(e){
      emit(state.copyWith(isLoading: false));
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          AppSnackBar().showSnackBar(title: "Signup Failed", subTitle: e.toString())
      );
    }
  }
}
