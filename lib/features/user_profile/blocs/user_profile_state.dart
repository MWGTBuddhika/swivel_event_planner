part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({
    required this.isLoading,
    required this.userProfile,
    required this.userProfileValidations
  });

  final bool isLoading;
  final UserProfile userProfile;
  final UserProfileValidations userProfileValidations;

  factory UserProfileState.initial() {
    return UserProfileState(
      isLoading: false,
      userProfile: UserProfile.initial(),
      userProfileValidations: UserProfileValidations.initial()
    );
  }

  UserProfileState copyWith({
    bool? isLoading,
    UserProfile? userProfile,
    UserProfileValidations? userProfileValidations
  }) {
    return UserProfileState(
      userProfile: userProfile ?? this.userProfile,
      isLoading: isLoading ?? this.isLoading,
      userProfileValidations: userProfileValidations ?? this.userProfileValidations
    );
  }

  bool get isFirstNameInvalid=> userProfileValidations.firstNameErrorText.isNotEmpty;
  bool get isLastNameInvalid=> userProfileValidations.lastNameErrorText.isNotEmpty;
  bool get isEmailInvalid=> userProfileValidations.emailErrorText.isNotEmpty;
  bool get isPhoneNumberInvalid=> userProfileValidations.phoneNumberErrorText.isNotEmpty;
  bool get isAddressInvalid=> userProfileValidations.mailingAddressErrorText.isNotEmpty;

  @override
  List<Object?> get props => [
    isLoading,
    userProfile,
    userProfileValidations
  ];
}