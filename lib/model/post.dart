import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  final String content;
  final String userId;
  final Array likes;
  final Array comment;
  final String repost;
  final Timestamp timestamp;

  Post({
    required this.postId,
    required this.userId,
    required this.content,
    required this.likes,
    required this.comment,
    required this.repost,
    required this.timestamp,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'] ?? "",
      userId: json['id'] ?? '',
      content: json['content'] ?? '',
      likes: json['likes'] ?? [],
      comment: json['comment'] ?? [],
      repost: json['repost'] ?? "",
      timestamp: json['timestamp']?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId' : userId,
      'content': content,
      'likes' : likes,
      'comment' : comment,
      "repost" : repost,
      'timestamp' : timestamp,
    };
  }
}
