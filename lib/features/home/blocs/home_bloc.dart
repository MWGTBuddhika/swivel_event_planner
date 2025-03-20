import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_planner/services/db_service.dart';
import 'package:event_planner/shared_components/models/organizer.dart';
import 'package:event_planner/shared_components/models/slider_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../shared_components/models/comment.dart';
import '../../../shared_components/models/dashboard_data_fetch_result.dart';
import '../../../shared_components/models/post.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<GetSliderImages>(_onGetSliderImages);
    on<GetOrganizers>(_onGetOrganizers);
    on<GetPosts>(_onGetPosts);
    on<GetComments>(_onGetComments);
  }
  DBService apiService = DBService.instance;

  Future<void> _onGetSliderImages(
      GetSliderImages event,
      emit,
      ) async {
   try{
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(sliderImagesLoading: true),
      ));
      final sliderImagesResponse = await apiService.getSliderImages();
      if(sliderImagesResponse!=null){
        emit(state.copyWith(sliderImages: sliderImagesResponse));
      }
      else{
        print("Error in fetching slider Images");
      }
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(sliderImagesLoading: false),
      ));
   }
   catch(e){
     print("Error in fetching slider Images $e");
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(sliderImagesLoading: false),
      ));
   }
  }

  Future<void> _onGetOrganizers(
      GetOrganizers event,
      emit,
      ) async {
    try{
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(organizersLoading: true),
      ));
      final organizersResponse = await apiService.getOrganizers();
      if(organizersResponse!=null){
        emit(state.copyWith(organizers: organizersResponse));
      }
      else{
        print("Error in fetching organizers");
      }
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(organizersLoading: false),
      ));
    }
    catch(e){
      print("Error in fetching organizers");
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(organizersLoading: false),
      ));
    }
  }
  Future<void> _onGetPosts(
      GetPosts event,
      emit,
      ) async {
    try{
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(postsLoading: true),
      ));
      final postsResponse = await apiService.getPosts();
      if(postsResponse!=null){
        emit(state.copyWith(posts: postsResponse));
      }
      else{
        print("Error in fetching posts");
      }
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(postsLoading: false),
      ));
    }
    catch(e){
      print("Error in fetching posts");
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(postsLoading: false),
      ));
    }
  }
  Future<void> _onGetComments(
      GetComments event,
      emit,
      ) async {
    try{
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(commentsLoading: true),
      ));
      final commentsResponse = await apiService.getComments();
      if(commentsResponse!=null){
        emit(state.copyWith(comments: commentsResponse));
      }
      else{
        print("Error in fetching comments");
      }
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(commentsLoading: false),
      ));
    }
    catch(e){
      print("Error in fetching comments");
      emit(state.copyWith(
        dataFetchResult: state.dataFetchResult.copyWith(commentsLoading: false),
      ));
    }
  }
}
