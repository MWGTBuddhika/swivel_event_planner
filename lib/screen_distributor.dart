import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/route/app_router.dart';
import 'shared_components/theme/color_pallet.dart';

class ScreenDistributor extends StatefulWidget {
  const ScreenDistributor({super.key});

  @override
  State<ScreenDistributor> createState() => _ScreenDistributorState();
}

class _ScreenDistributorState extends State<ScreenDistributor> {

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();
    const mainThemePrimaryColor = ColorPallet.defaultColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPallet.defaultColor,
      body: Stack(
        children: [
          MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: ThemeData.localize(
              baseTheme.copyWith(
                  scaffoldBackgroundColor: mainThemePrimaryColor,
                  textSelectionTheme: TextSelectionThemeData(
                      cursorColor: ColorPallet.black.withOpacity(0.5)
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          minimumSize: MaterialStateProperty.all(Size(300, 50)),
                          maximumSize: MaterialStateProperty.all(Size(700, 100)),
                          textStyle: MaterialStateProperty.all(baseTheme.textTheme.bodyMedium)
                      )
                  ),
                  colorScheme: baseTheme.colorScheme.copyWith(
                    // This is the colour used by an appBar when Brightness is set to light
                    primary: mainThemePrimaryColor,
                    // This is the colour used by an appBar when Brightness is set to dark
                    surface: mainThemePrimaryColor,
                    // Brightness set to dark for better contrast.
                    brightness: Brightness.dark,
                  ),
                  primaryColor: mainThemePrimaryColor,
                  // This is a fix for the case where when setting Brightness to dark,
                  // the default value for SnackBar text is not set to a readable colour.
                  snackBarTheme: SnackBarThemeData(
                      contentTextStyle: TextStyle(color: Colors.white)
                  )
              ),
              baseTheme.textTheme,
            ),
            builder: (context, child) {
              return MediaQuery(
                child: child!,
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
              );
            },
          ),
        ],
      ),
    );
  }
}
