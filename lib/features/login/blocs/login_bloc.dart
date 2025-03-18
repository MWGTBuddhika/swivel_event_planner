import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../../shared_components/util/regex.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<CheckUserEmailInputs>(_onCheckUserEmailInputs);
    on<CheckUserPasswordInputs>(_onCheckUserPasswordInputs);
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
  }
}
