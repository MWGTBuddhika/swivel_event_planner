
class DashboardDataFetchResult {
  final bool sliderImagesLoading;
  final bool organizersLoading;
  final bool postsLoading;
  final bool commentsLoading;

  DashboardDataFetchResult({
    required this.sliderImagesLoading,
    required this.organizersLoading,
    required this.postsLoading,
    required this.commentsLoading,
  });

  DashboardDataFetchResult copyWith({
    bool? sliderImagesLoading,
    bool? organizersLoading,
    bool? postsLoading,
    bool? commentsLoading,
  }) {
    return DashboardDataFetchResult(
      sliderImagesLoading: sliderImagesLoading ?? this.sliderImagesLoading,
      organizersLoading: organizersLoading ?? this.organizersLoading,
      postsLoading: postsLoading ?? this.postsLoading,
      commentsLoading: commentsLoading ?? this.commentsLoading,
    );
  }

  factory DashboardDataFetchResult.initial() {
    return DashboardDataFetchResult(
        sliderImagesLoading: false,
        organizersLoading: false,
      postsLoading: false,
      commentsLoading: false,
    );
  }
}