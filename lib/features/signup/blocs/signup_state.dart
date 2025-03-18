part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.isLoading,
    required this.emailErrorText,
    required this.passwordErrorText,
    required this.confirmPasswordErrorText,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final bool isLoading;
  final String emailErrorText;
  final String passwordErrorText;
  final String confirmPasswordErrorText;
  final String email;
  final String password;
  final String confirmPassword;

  factory SignUpState.initial() {
    return SignUpState(
        isLoading: false,
      email: '',
      emailErrorText: '',
      password: '',
      passwordErrorText: '',
      confirmPassword:'',
      confirmPasswordErrorText:''
    );
  }

  SignUpState copyWith({
    bool? isLoading,
    String? emailErrorText,
    String? passwordErrorText,
    String? email,
    String? password,
    String? confirmPassword,
    String? confirmPasswordErrorText,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      password: password ?? this.password,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmPasswordErrorText: confirmPasswordErrorText ?? this.confirmPasswordErrorText,
    );
  }

  bool get isSignupButtonShouldEnable=> emailErrorText.isEmpty && passwordErrorText.isEmpty && confirmPasswordErrorText.isEmpty &&
      email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty && password==confirmPassword;

  @override
  List<Object?> get props => [
    isLoading,
    passwordErrorText,
    emailErrorText,
    email,
    password,
    confirmPassword,
    confirmPasswordErrorText
  ];
}
