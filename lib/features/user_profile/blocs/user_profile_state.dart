part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({
    required this.isLoading,
    required this.userProfile,
    required this.userProfileValidations,
    required this.isEditFieldsClicked
  });

  final bool isLoading;
  final UserProfile userProfile;
  final UserProfileValidations userProfileValidations;
  final bool isEditFieldsClicked;

  factory UserProfileState.initial() {
    return UserProfileState(
      isLoading: false,
      userProfile: UserProfile.initial(),
      userProfileValidations: UserProfileValidations.initial(),
      isEditFieldsClicked: false
    );
  }

  UserProfileState copyWith({
    bool? isLoading,
    UserProfile? userProfile,
    UserProfileValidations? userProfileValidations,
    bool? isEditFieldsClicked
  }) {
    return UserProfileState(
      userProfile: userProfile ?? this.userProfile,
      isLoading: isLoading ?? this.isLoading,
      userProfileValidations: userProfileValidations ?? this.userProfileValidations,
      isEditFieldsClicked: isEditFieldsClicked ?? this.isEditFieldsClicked
    );
  }

  bool get isFirstNameInvalid=> userProfileValidations.firstNameErrorText.isNotEmpty;
  bool get isLastNameInvalid=> userProfileValidations.lastNameErrorText.isNotEmpty;
  bool get isEmailInvalid=> userProfileValidations.emailErrorText.isNotEmpty;
  bool get isPhoneNumberInvalid=> userProfileValidations.phoneNumberErrorText.isNotEmpty;
  bool get isAddressInvalid=> userProfileValidations.mailingAddressErrorText.isNotEmpty;

  bool get isAllFormFieldsValidated=>
      userProfileValidations.firstNameErrorText.isEmpty && userProfile.firstName.isNotEmpty &&
      userProfileValidations.lastNameErrorText.isEmpty && userProfile.lastName.isNotEmpty &&
      userProfileValidations.emailErrorText.isEmpty && userProfile.email.isNotEmpty &&
      userProfileValidations.phoneNumberErrorText.isEmpty && userProfile.phoneNumber.isNotEmpty &&
      userProfileValidations.mailingAddressErrorText.isEmpty && userProfile.mailingAddress.isNotEmpty;

  @override
  List<Object?> get props => [
    isLoading,
    userProfile,
    userProfileValidations,
    isEditFieldsClicked
  ];
}