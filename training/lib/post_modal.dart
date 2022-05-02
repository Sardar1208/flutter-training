import 'dart:convert';

List<Post> postFromJson(String str) {
  final jsonData = json.decode(str);
  List<Post> list = [];
  for (var i = 0; i < jsonData.length; i++) {
    list.add(Post.fromJson(jsonData[i]));
  }
  return list;
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
