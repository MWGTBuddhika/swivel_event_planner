part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.sliderImages,
    required this.organizers,
    required this.posts,
    required this.comments,
    required this.dataFetchResult
  });

  final List<SliderImage> sliderImages;
  final List<Organizer> organizers;
  final List<Post> posts;
  final List<Comment> comments;
  final DashboardDataFetchResult dataFetchResult;

  factory HomeState.initial() {
    return HomeState(
        sliderImages: [],
        organizers: [],
        posts: [],
        comments: [],
        dataFetchResult: DashboardDataFetchResult.initial()
    );
  }

  HomeState copyWith({
    List<SliderImage>? sliderImages,
    List<Organizer>? organizers,
    List<Post>? posts,
    List<Comment>? comments,
    DashboardDataFetchResult? dataFetchResult
  }) {
    return HomeState(
        sliderImages: sliderImages ?? this.sliderImages,
        organizers: organizers ?? this.organizers,
        posts: posts ?? this.posts,
        comments: comments ?? this.comments,
        dataFetchResult: dataFetchResult ?? this.dataFetchResult
    );
  }

  bool get isAnyDataLoading=> dataFetchResult.sliderImagesLoading || dataFetchResult.organizersLoading || dataFetchResult.postsLoading || dataFetchResult.commentsLoading;
  bool get isPostsLoading=> dataFetchResult.postsLoading;

  @override
  List<Object?> get props => [
    sliderImages,
    organizers,
    dataFetchResult,
    posts,
    comments
  ];
}
