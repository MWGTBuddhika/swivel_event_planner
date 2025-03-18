class RegexValidator{
  static bool isValidEmail(String email){
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
  static bool isValidName(String name){
    final nameRegex = RegExp(r"^[a-zA-Z]{3,10}$");
    return nameRegex.hasMatch(name);
  }
  static bool isValidContactNumber(String contactNumber) {
    final phoneNumberRegex = RegExp(r'^(?:\+94|0)([7][0-9]{8}|[1-9][0-9]{8})$');
    return phoneNumberRegex.hasMatch(contactNumber);
  }
  static bool isValidDob(DateTime dob){
    DateTime today = DateTime.now();
    DateTime adultDate = DateTime(
      dob.year + 18,
      dob.month,
      dob.day,
    );
    return adultDate.isBefore(today) || adultDate.isAtSameMomentAs(today);
  }
  static bool isValidPassword(String password){
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{3,}$');
    return passwordRegex.hasMatch(password);
  }
  static bool isValidAddress(String address){
    final addressRegex = RegExp(r'^.{6,50}$');
    return addressRegex.hasMatch(address);
  }

}