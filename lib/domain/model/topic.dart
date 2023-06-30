class Topic {
  final String id;
  final String admin;
  final String name;
  final String createdTime;
  final String description;

  Topic({
    required this.id,
    required this.admin,
    required this.name,
    required this.createdTime,
    required this.description,
  }) : super();

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'],
      admin: json['admin'],
      name: json['name'],
      createdTime: json['created_time'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'admin': admin,
        'name': name,
        'created_time': createdTime,
        'description': description,
      };
}
