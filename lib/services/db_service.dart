import 'dart:async';
import 'package:event_planner/shared_components/models/comment.dart';
import 'package:event_planner/shared_components/models/organizer.dart';
import 'package:event_planner/shared_components/models/slider_image.dart';

import '../shared_components/models/post.dart';
import 'api_service.dart';


class DBService {

  static final DBService instance = DBService._internal();

  factory DBService() => instance;

  DBService._internal();

  final ApiService apiGateway= ApiService.instance;

  Future<List<SliderImage>?> getSliderImages() async {
    try {
      final response = await apiGateway.get('photos');
      final data = SliderImage.fromJsonList(response).take(10).toList();
      return data;
    } catch (e) {
      throw Exception('Failed to get slider photos Data: $e');
    } finally {
    }
  }

  Future<List<Organizer>?> getOrganizers() async {
    try {
      final response = await apiGateway.get('users');
      final data = Organizer.fromJsonList(response);
      return data;
    } catch (e) {
      throw Exception('Failed to get organizers Data: $e');
    } finally {
    }
  }
  Future<List<Post>?> getPosts() async {
    try {
      final response = await apiGateway.get('posts');
      final data = Post.fromJsonList(response);
      return data;
    } catch (e) {
      throw Exception('Failed to get posts Data: $e');
    } finally {
    }
  }
  Future<List<Comment>?> getComments() async {
    try {
      final response = await apiGateway.get('comments');
      final data = Comment.fromJsonList(response);
      return data;
    } catch (e) {
      throw Exception('Failed to get comments Data: $e');
    } finally {
    }
  }

}
