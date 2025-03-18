import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    // on<SaveUserFCMToken>(_onSaveUserFCMToken);
  }

  // Future<void> _onSaveUserFCMToken(
  //     SaveUserFCMToken event,
  //   emit,
  // ) async {
  //   final bool fcmTokenSaveSuccess = await firebaseService.saveUserFCMToken(event.fcmToken,event.userType);
  // }
}
