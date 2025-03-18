import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    // on<SaveUserFCMToken>(_onSaveUserFCMToken);
  }

  // Future<void> _onSaveUserFCMToken(
  //     SaveUserFCMToken event,
  //   emit,
  // ) async {
  //   final bool fcmTokenSaveSuccess = await firebaseService.saveUserFCMToken(event.fcmToken,event.userType);
  // }
}
