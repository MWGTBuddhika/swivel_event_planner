import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/event_planner_app.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:event_planner/shared_components/widgets/snackbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:developer' as developer;

import 'core/blocs/bloc_observer.dart';

void main() async {
  // Ensure that any error occurring during the application startup is captured and logged
  await runZonedGuarded(() async {
    // Initialize Flutter bindings before running the app
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase services asynchronously
    await Firebase.initializeApp().then((value) {
      debugPrint("Firebase Initialized");
    });

    // Lock the screen orientation to portrait mode (both up and down)
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Set the system UI overlay style (status bar and navigation bar configurations)
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,  // Dark icons for status bar
        systemNavigationBarColor: ColorPallet.bottomNavbarBgColor,  // Bottom navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark,  // Dark icons for navigation bar
        statusBarColor: Colors.transparent));  // Transparent status bar background

    // Set Firestore settings (this can be customized as needed)
    FirebaseFirestore.instance.settings = const Settings();

    runApplication();
  }, onError);
}

Future<void> runApplication() async {
  Bloc.observer = BlocDelegateObserver();

  // Launch the root widget of the app
  runApp(EventPlannerApp());
}

void onError(dynamic error, StackTrace stack) {
  // Log the error message and stack trace for debugging
  developer.log("Error caught from zone: " + error.toString());
  developer.log("Error caught from zone StackTrace: " + stack.toString());

  // If there is an active context, display a SnackBar to inform the user of the error
  if (Get.context != null) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      AppSnackBar().showSnackBar(
        title: "Error caught from zone",
        subTitle: error.toString(),
      ),
    );
  }
}
