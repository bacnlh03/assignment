class PostType {
  final String type;
  final String? url;

  const PostType({
    required this.type,
    this.url,
  });

  factory PostType.fromJson(Map<String, dynamic> json) {
    return PostType(
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
      };
}
