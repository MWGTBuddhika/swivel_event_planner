import 'dart:convert';

class Comment {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  Comment({
    this.id,
    this.postId,
    this.name,
    this.email,
    this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  static List<Comment> fromJsonList(String str) {
    return List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));
  }
}