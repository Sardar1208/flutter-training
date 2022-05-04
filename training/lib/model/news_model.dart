import "dart:convert";
import 'package:uuid/uuid.dart';

class News {
  Source source;
  String author;
  String title;
  String description;
  String date;
  String imageUrl;
  bool liked;
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

  factory News.fromJson(Map<String, dynamic> parsedJson) {
    return News(
      source: Source.fromJson(parsedJson['source']),
      author: parsedJson['author'],
      title: parsedJson['title'],
      description: parsedJson['description'],
      date: parsedJson['publishedAt'],
      imageUrl: parsedJson['urlToImage'],
      liked: false,
    );
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
