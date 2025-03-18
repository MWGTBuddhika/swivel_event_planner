import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route',)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignupRoute.page),
    CustomRoute(page: ProfilePictureUploadRoute.page,transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: PersonalInformationRoute.page,transitionsBuilder: TransitionsBuilders.slideLeft),
    AutoRoute(page: DashboardRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: UserProfileRoute.page),
        ]),
  ];

}




final AppRouter appRouter = AppRouter();
late TabsRouter tabsRouter;
/*
 * Page name should contain 'Screen' at the end.
 * 'Screen' will replace with 'Route'.
 * Code generation need to run in order to effect the changes
 * TODO: You can run :-
           'flutter packages pub run build_runner build' each time you edit this file
            OR
            'flutter packages pub run build_runner watch' to watch code changes and regenerate

*/
