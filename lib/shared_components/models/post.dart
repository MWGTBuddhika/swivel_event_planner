import 'dart:convert';

class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  static List<Post> fromJsonList(String str) {
    return List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
  }
}