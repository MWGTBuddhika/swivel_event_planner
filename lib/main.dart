import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/event_planner_app.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

import 'core/blocs/bloc_observer.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp().then((value) {
      debugPrint("Firebase Initialized");
    });
    // Lock to portrait
    SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorPallet.bottomNavbarBgColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    FirebaseFirestore.instance.settings = const Settings();
    runApplication();
  }, onError);
}

Future<void> runApplication() async {
  Bloc.observer = BlocDelegateObserver();
  runApp(EventPlannerApp());
}

void onError(dynamic error, StackTrace stack) {
  developer.log("error caught from zone: " + error.toString());
  developer.log("error caught from zone StackTrace: " + stack.toString());
}
