part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetSliderImages extends HomeEvent {
  GetSliderImages();
}
class GetOrganizers extends HomeEvent {
  GetOrganizers();
}
class GetPosts extends HomeEvent {
  GetPosts();
}
class GetComments extends HomeEvent {
  GetComments();
}