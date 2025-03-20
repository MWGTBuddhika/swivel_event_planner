import 'package:event_planner/features/login/blocs/login_bloc.dart';
import 'package:event_planner/features/signup/blocs/signup_bloc.dart';
import 'package:event_planner/screen_distributor.dart';
import 'package:event_planner/services/api_service.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'features/home/blocs/home_bloc.dart';
import 'features/user_profile/blocs/user_profile_bloc.dart';

// Main application widget, where the app is initialized and configured
class EventPlannerApp extends StatefulWidget {
  const EventPlannerApp({super.key});

  @override
  State<EventPlannerApp> createState() => _EventPlannerAppState();
}

class _EventPlannerAppState extends State<EventPlannerApp> with WidgetsBindingObserver {
  // This method monitors app lifecycle changes (e.g., when the app is paused or resumed)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("State: ${state.name}");

    if (state == AppLifecycleState.resumed) {
      print("App Resumed");
    }

    if (state == AppLifecycleState.paused) {
      print("App Paused");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Providing multiple BLoCs and services to the widget tree
      providers: [
        Provider(
            lazy: false,
            create: (context) => ApiService(baseUrl: Constants.baseUrl)),

        BlocProvider<LoginBloc>(
          lazy: false,
          create: (context) => LoginBloc(),
        ),

        BlocProvider<SignupBloc>(
          lazy: false,
          create: (context) => SignupBloc(),
        ),

        BlocProvider<UserProfileBloc>(
          lazy: false,
          create: (context) => UserProfileBloc(),
        ),

        BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => HomeBloc(),
        ),
      ],

      child: GetMaterialApp(
        home: ScreenDistributor(),  // Widget responsible for determining which screen to display
        debugShowCheckedModeBanner: false,  // Disables the "Debug" banner in the app
      ),
    );
  }
}
