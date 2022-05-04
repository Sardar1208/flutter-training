import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/model/news_model.dart';

class NewsList extends ChangeNotifier {
  List<News> newsList = [];

  void addNews(List<dynamic> data) {
    for (var i = 0; i < data.length; i++) {
      print("runned");
      var source = Source(
        id: data[i]['source']['id'],
        name: data[i]['source']['id'],
      );

      var news = News(
        source: source,
        author: data[i]['author'],
        title: data[i]['title'],
        description: data[i]['description'],
        date: data[i]['publishedAt'],
        imageUrl: data[i]['urlToImage'],
        liked: false,
      );

      newsList.add(news);
    }
    notifyListeners();
  }

  void changeLike(String id) {
    print(id);
    for (var i = 0; i < newsList.length; i++) {
      if (newsList[i].id == id) {
        print(i);
        newsList[i].liked = !newsList[i].liked;
      }
    }
    notifyListeners();
  }
}
