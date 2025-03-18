
import 'package:equatable/equatable.dart';

class UserProfileValidations extends Equatable {
  final String firstNameErrorText;
  final String lastNameErrorText;
  final String emailErrorText;
  final String phoneNumberErrorText;
  final String mailingAddressErrorText;

  UserProfileValidations({
    required this.firstNameErrorText,
    required this.lastNameErrorText,
    required this.emailErrorText,
    required this.phoneNumberErrorText,
    required this.mailingAddressErrorText,
  });

  UserProfileValidations copyWith({
    String? firstNameErrorText,
    String? lastNameErrorText,
    String? emailErrorText,
    String? phoneNumberErrorText,
    String? mailingAddressErrorText,
  }) {
    return UserProfileValidations(
      firstNameErrorText: firstNameErrorText ?? this.firstNameErrorText,
      lastNameErrorText: lastNameErrorText ?? this.lastNameErrorText,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      phoneNumberErrorText: phoneNumberErrorText ?? this.phoneNumberErrorText,
      mailingAddressErrorText: mailingAddressErrorText ?? this.mailingAddressErrorText,
    );
  }

  factory UserProfileValidations.initial() {
    return UserProfileValidations(
        firstNameErrorText: '',
        lastNameErrorText: '',
        emailErrorText: '',
        phoneNumberErrorText: '',
        mailingAddressErrorText: '',
    );
  }


  @override
  List<Object?> get props => [
    firstNameErrorText,
    lastNameErrorText,
    emailErrorText,
    phoneNumberErrorText,
    mailingAddressErrorText,
  ];
}