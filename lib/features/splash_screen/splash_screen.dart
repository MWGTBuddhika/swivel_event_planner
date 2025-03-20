import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:event_planner/features/user_profile/blocs/user_profile_bloc.dart';
import 'package:event_planner/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/route/app_router.dart';
import '../../core/route/app_router.gr.dart';
import '../../services/fcm_service.dart';
import '../../shared_components/theme/text_styles.dart';
import '../../shared_components/util/images.dart';
import '../../shared_components/widgets/page_base.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? _fbUser;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () async {
        _fbUser =FirebaseService.instance.currentUser;
        if(_fbUser!=null){
          final fcmService = FCMService.instance;
          bool notificationPermissions = await fcmService.requestPermission();
          final fcmToken = await fcmService.getDeviceToken();
          debugPrint("FCM Token: ${fcmToken}");
          if(fcmToken.isNotEmpty){
            context.read<UserProfileBloc>().add(SaveFCMToken(fcmToken: fcmToken));
            print("FCM Token not fetched notifications will not be received");
          }
          else{
            print("FCM Token not fetched notifications will not be received");
          }
          //get user profile from fire store
          context.read<UserProfileBloc>().add(GetUserProfile());
          appRouter.replaceAll([DashboardRoute()]);
          //Get.context?.read<EmployeeProfileBloc>().add(GetEmployeeProfile(_fbUser!.uid));
        }else{
          debugPrint('User Not found');
          appRouter.replaceAll([LoginRoute()]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBase(
      showAppBar: false,
      bodyObservesSafeArea: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple,Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: Image.asset(ImageAssets.logo,width: 200,)),
          ),
          Positioned(
            bottom: 30,
            child: Text("Launching in...",style:ThemeTextStyles.splashScreenTextStyle),
          )
        ],
      ),
    );
  }
}
