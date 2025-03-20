
import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String mailingAddress;
  final String imageUrl;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.mailingAddress,
    required this.imageUrl,
  });

  UserProfile copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? mailingAddress,
    String? imageUrl,
  }) {
    return UserProfile(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      mailingAddress: mailingAddress ?? this.mailingAddress,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory UserProfile.initial() {
    return UserProfile(
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      mailingAddress: '',
      imageUrl: ''
    );
  }

  /// Factory method to create an `UserProfile` from a Firebase document snapshot.
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      mailingAddress: json['mailingAddress'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'mailingAddress': mailingAddress,
      'imageUrl': imageUrl,
    };
  }


  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    phoneNumber,
    mailingAddress,
    imageUrl,
  ];
}