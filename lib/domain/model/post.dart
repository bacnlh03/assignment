import 'package:assignment/core/extensions.dart';

import 'post_type.dart';
import 'topic.dart';

class Post {
  final String id;
  final String accountId;
  final Topic topic;
  final String title;
  final String body;
  final PostType postType;
  final String time;

  Post({
    required this.id,
    required this.accountId,
    required this.topic,
    required this.title,
    required this.body,
    required this.postType,
    required this.time,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      accountId: json['account_id'],
      topic: Topic.fromJson(json['topic']),
      title: json['title'],
      body: json['body'],
      postType: PostType.fromJson(json['post_type']),
      time: int.parse(json['time']).toDateTime(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'account_id': accountId,
        'topic': topic.toJson(),
        'title': title,
        'body': body,
        'post_type': postType.toJson(),
        'time': time,
      };
}
