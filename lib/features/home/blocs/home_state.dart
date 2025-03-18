part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.appLoading
  });

  final bool appLoading;

  factory HomeState.initial() {
    return HomeState(
      appLoading: false
    );
  }

  HomeState copyWith({
    bool? appLoading,
  }) {
    return HomeState(
        appLoading: appLoading ?? this.appLoading,
    );
  }

  @override
  List<Object?> get props => [
    appLoading
  ];
}
