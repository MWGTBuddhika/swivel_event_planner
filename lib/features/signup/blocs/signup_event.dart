part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class ValidateEmailInputs extends SignupEvent {
  final String text;
  ValidateEmailInputs({required this.text});
}

class ValidatePasswordInputs extends SignupEvent {
  final String text;
  ValidatePasswordInputs({required this.text});
}

class ValidateConfirmPasswordInputs extends SignupEvent {
  final String text;
  ValidateConfirmPasswordInputs({required this.text});
}

class UserSignup extends SignupEvent {
  UserSignup();
}
