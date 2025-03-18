import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FirebaseService {

  static final FirebaseService instance = FirebaseService._internal();

  factory FirebaseService() => instance;

  FirebaseService._internal();

  /// Wrapper for `FirebaseAuth.instance.currentUser()`
  User? get currentUser => _auth.currentUser;

  /// Sign in with email & password.
  ///
  /// Returns the current user if successful, else null.
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        print('Invalid Credentials');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// Wrapper for `FirebaseAuth.instance.sendPasswordResetEmail()`.
  Future<void> sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user?.sendEmailVerification(null);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw 'The account already exists for that email.';
      }else{
        print(e);
        rethrow;
      }
      return null;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Sign out current user
  Future<void> signOut() async {
    return _auth
        .signOut();
  }

  Future<String> uploadImage(File file ) async {

    try {
      // Create a reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('uploads/${currentUser?.uid}.jpg');

      // Upload the file
      await storageRef.putFile(file);

      // Get the download URL
      String downloadUrl = await storageRef.getDownloadURL();
      print('Uploaded Image URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      throw 'Upload failed: $e';
    }
  }

  // Future<void> saveUserDetails(String uid, EmployeeSignupDetails employeeSignupDetails) async {
  //   CollectionReference employees = FirebaseFirestore.instance.collection('employees');
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   try {
  //     List<String> jobRoles = employeeSignupDetails.jobRoles.map((jobRole) => jobRole.name).toList();
  //     users.doc(uid).set({
  //       'id': uid,
  //       'userType': 'employee',
  //       'name': employeeSignupDetails.name,
  //     });
  //     employees.doc(uid).set({
  //       'id': uid,
  //       'name': employeeSignupDetails.name,
  //       'email': employeeSignupDetails.email,
  //       'jobRoles': jobRoles,
  //       'availableDays': employeeSignupDetails.availableDays.toMap(),
  //       'contactNumber': employeeSignupDetails.contactNumber,
  //       'dob': employeeSignupDetails.dob,
  //       'nic': employeeSignupDetails.nic,
  //       'createdAt': FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
