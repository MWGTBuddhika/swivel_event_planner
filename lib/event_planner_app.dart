
import 'package:event_planner/features/login/blocs/login_bloc.dart';
import 'package:event_planner/features/signup/blocs/signup_bloc.dart';
import 'package:event_planner/screen_distributor.dart';
import 'package:event_planner/services/api_service.dart';
import 'package:event_planner/services/db_service.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'core/blocs/app_bloc/app_bloc.dart';
import 'features/home/blocs/home_bloc.dart';
import 'features/user_profile/blocs/user_profile_bloc.dart';

class EventPlannerApp extends StatefulWidget {
  const EventPlannerApp({super.key});

  @override
  State<EventPlannerApp> createState() => _EventPlannerAppState();
}


class _EventPlannerAppState extends State<EventPlannerApp> with WidgetsBindingObserver {
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
  initState() {
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
      providers: [
        Provider(
            lazy: false,
            create: (context) => ApiService(baseUrl: Constants.baseUrl)),
        BlocProvider<AppBloc>(
          lazy: false,
          create: (context) => AppBloc(),
        ),
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
        home: ScreenDistributor(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
