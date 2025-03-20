// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:event_planner/features/home/dashboard.dart' as _i1;
import 'package:event_planner/features/home/home_screen.dart' as _i2;
import 'package:event_planner/features/home/posts_screen.dart' as _i5;
import 'package:event_planner/features/login/login_screen.dart' as _i3;
import 'package:event_planner/features/onboarding/personal_information_screeen.dart'
    as _i4;
import 'package:event_planner/features/onboarding/profile_picture_upload_screen.dart'
    as _i6;
import 'package:event_planner/features/signup/signup_screen.dart' as _i7;
import 'package:event_planner/features/splash_screen/splash_screen.dart' as _i8;
import 'package:event_planner/features/user_profile/user_profile_screen.dart'
    as _i9;
import 'package:flutter/cupertino.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    PersonalInformationRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInformationRouteArgs>(
          orElse: () => const PersonalInformationRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PersonalInformationScreen(key: args.key),
      );
    },
    PostsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PostsScreen(),
      );
    },
    ProfilePictureUploadRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePictureUploadRouteArgs>(
          orElse: () => const ProfilePictureUploadRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProfilePictureUploadScreen(key: args.key),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SignupScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () => const UserProfileRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.UserProfileScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<LoginRouteArgs> page =
      _i10.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.PersonalInformationScreen]
class PersonalInformationRoute
    extends _i10.PageRouteInfo<PersonalInformationRouteArgs> {
  PersonalInformationRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          PersonalInformationRoute.name,
          args: PersonalInformationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PersonalInformationRoute';

  static const _i10.PageInfo<PersonalInformationRouteArgs> page =
      _i10.PageInfo<PersonalInformationRouteArgs>(name);
}

class PersonalInformationRouteArgs {
  const PersonalInformationRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'PersonalInformationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.PostsScreen]
class PostsRoute extends _i10.PageRouteInfo<void> {
  const PostsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfilePictureUploadScreen]
class ProfilePictureUploadRoute
    extends _i10.PageRouteInfo<ProfilePictureUploadRouteArgs> {
  ProfilePictureUploadRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProfilePictureUploadRoute.name,
          args: ProfilePictureUploadRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfilePictureUploadRoute';

  static const _i10.PageInfo<ProfilePictureUploadRouteArgs> page =
      _i10.PageInfo<ProfilePictureUploadRouteArgs>(name);
}

class ProfilePictureUploadRouteArgs {
  const ProfilePictureUploadRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ProfilePictureUploadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SignupScreen]
class SignupRoute extends _i10.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i10.PageInfo<SignupRouteArgs> page =
      _i10.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.UserProfileScreen]
class UserProfileRoute extends _i10.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i10.PageInfo<UserProfileRouteArgs> page =
      _i10.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key}';
  }
}
