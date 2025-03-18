part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class ValidateFirstName extends UserProfileEvent {
  final String text;
  ValidateFirstName({required this.text});
}
class ValidateLastName extends UserProfileEvent {
  final String text;
  ValidateLastName({required this.text});
}
class ValidateEmail extends UserProfileEvent {
  final String text;
  ValidateEmail({required this.text});
}
class ValidatePhoneNumber extends UserProfileEvent {
  final String text;
  ValidatePhoneNumber({required this.text});
}
class ValidateMailingAddress extends UserProfileEvent {
  final String text;
  ValidateMailingAddress({required this.text});
}
class PickAndUploadUserImage extends UserProfileEvent {
  PickAndUploadUserImage();
}
