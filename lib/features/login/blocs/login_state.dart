part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.isLoading,
    required this.emailErrorText,
    required this.passwordErrorText,
    required this.email,
    required this.password,
  });

  final bool isLoading;
  final String emailErrorText;
  final String passwordErrorText;
  final String email;
  final String password;

  factory LoginState.initial() {
    return LoginState(
        isLoading: false,
      email: '',
      emailErrorText: '',
      password: '',
      passwordErrorText: ''
    );
  }

  LoginState copyWith({
    bool? isLoading,
    String? emailErrorText,
    String? passwordErrorText,
    String? email,
    String? password,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      password: password ?? this.password,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      email: email ?? this.email
    );
  }

  bool get isLoginFieldsValidated=> emailErrorText.isEmpty && passwordErrorText.isEmpty &&
      email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [
    isLoading,
    passwordErrorText,
    emailErrorText,
    email,
    password
  ];
}
