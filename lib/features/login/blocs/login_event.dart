part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class CheckUserEmailInputs extends LoginEvent {
  final String text;
  CheckUserEmailInputs({required this.text});
}

class CheckUserPasswordInputs extends LoginEvent {
  final String text;
  CheckUserPasswordInputs({required this.text});
}

class UserLogout extends LoginEvent {
  UserLogout();
}

class UserLogin extends LoginEvent {
  UserLogin();
}
