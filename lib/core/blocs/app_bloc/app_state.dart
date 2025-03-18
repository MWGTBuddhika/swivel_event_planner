part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    required this.appLoading
  });

  final bool appLoading;

  factory AppState.initial() {
    return AppState(
      appLoading: false
    );
  }

  AppState copyWith({
    bool? appLoading,
  }) {
    return AppState(
        appLoading: appLoading ?? this.appLoading,
    );
  }

  @override
  List<Object?> get props => [
    appLoading
  ];
}
