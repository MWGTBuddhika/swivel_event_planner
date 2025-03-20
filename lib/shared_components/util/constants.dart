import 'dart:math';

class Constants {
  static const String welcome = 'Welcome';
  static const String welcomeToYourPortal = 'Welcome to your Portal';
  static const String uploadPictureDesc = 'You are logged in for the first time and can \nupload a profile photo';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String login = 'Login';
  static const String signup = 'Signup';
  static const String next = 'Next';
  static const String back = 'Back';
  static const String restorePassword = 'Restore Password';
  static const String invalidEmail = 'Invalid Email';
  static const String personalInfo = 'Personal info';
  static const String personalInfoDesc = 'You can add your personal data now or do it later';
  static const String invalidPassword = 'Password: Must contain\n* At least 1 capital letter (A-Z)\n* At least 1 lowercase letter (a-z)\n* At least 1 number (0-9)\n* Minimum 3 characters';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String phoneNumber = 'Phone Number';
  static const String mailingAddress = 'Mailing Address';
  static const String invalidName = 'Invalid Name';
  static const String invalidPhoneNumber = 'Invalid Phone Number';
  static const String invalidMailingAddress = 'Invalid Mailing Address';
  static const String organizers = 'Organizers';
  static const String photos = 'Photos';
  static const String allPhotos = 'All Photos';
  static const String posts = 'Posts';
  static const String logout = 'Logout';
  static const String home = 'Home';
  static const String profile = 'Profile';
  static const String edit = 'Edit';
  static const String save = 'Save';
  static const String comments = 'Comments';

  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';
  String getRandomImageUrl() =>'https://picsum.photos/id/${Random().nextInt(50)}/300/200';
}