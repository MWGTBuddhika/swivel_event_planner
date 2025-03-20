import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/app_router.dart';
import '../../../core/route/app_router.gr.dart';
import '../../../services/firebase_service.dart';
import '../../../shared_components/util/regex.dart';
import '../../../shared_components/util/snackbar.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<CheckUserEmailInputs>(_onCheckUserEmailInputs);
    on<CheckUserPasswordInputs>(_onCheckUserPasswordInputs);
    on<UserLogout>(_onUserLogout);
    on<UserLogin>(_onUserLogin);
  }

  Future<void> _onCheckUserEmailInputs(
      CheckUserEmailInputs event,
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

  Future<void> _onCheckUserPasswordInputs(
      CheckUserPasswordInputs event,
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

  Future<void> _onUserLogin(
      UserLogin event,
      emit,
      ) async {
    emit(state.copyWith(isLoading: true));
      try {
        final fbUser = await FirebaseService.instance.signInWithEmailAndPassword(
            state.email,
            state.password
        );
        if(fbUser!=null){
          appRouter.replaceAll([SplashRoute()]);
        }
      } on FirebaseAuthException {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            AppSnackBar().showSnackBar(
              title: "Invalid Credentials",
              subTitle: "You entered Email or Password is incorrect please check again",
            )
        );
      } catch (e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            AppSnackBar().showSnackBar(
              title: "Invalid Credentials",
              subTitle: "You entered Email or Password is incorrect please check again",
            )
        );
        print(e);
      }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onUserLogout(
      UserLogout event,
      emit,
      ) async {
    await FirebaseService().signOut();
    appRouter.replaceAll([LoginRoute()]);
  }
}
