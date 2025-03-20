import 'dart:convert';

import 'package:event_planner/shared_components/util/constants.dart';

class SliderImage {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  SliderImage({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory SliderImage.fromJson(Map<String, dynamic> json) {
    return SliderImage(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      // url: json['url'] as String?,
      url: Constants().getRandomImageUrl(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );
  }

  static List<SliderImage> fromJsonList(String str) {
    final List<dynamic> jsonData = json.decode(str);
    return jsonData.map((item) => SliderImage.fromJson(item)).toList();
  }
}