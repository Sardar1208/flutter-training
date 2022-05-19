import "dart:convert";
import 'package:uuid/uuid.dart';

class News {
  late Source source;
  late String author;
  late String title;
  late String description;
  late String date;
  late String imageUrl;
  late bool liked;
  String id = const Uuid().v4();

  News({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.liked,
  });

  News.fromJson(Map<String, dynamic> parsedJson) {
    source = Source.fromJson(parsedJson['source']);
    author = parsedJson['author'] ?? "";
    title = parsedJson['title'] ?? "";
    description = parsedJson['description'] ?? "";
    date = parsedJson['publishedAt'] ?? "";
    imageUrl = parsedJson['urlToImage'] ?? "";
    liked = false;
  }
}

class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
