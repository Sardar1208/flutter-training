import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/model/news_model.dart';
import 'package:training/view_models/base_model.dart';

class NewsList extends BaseModel {
  String GET_NEWS = "get_news";
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

      // newsList.add(news);
      newsList.add(News.fromJson(data[i]));
    }
    setStatus(GET_NEWS, Status.Done);
  }

  void changeLike(String id) {
    print(id);
    for (var i = 0; i < newsList.length; i++) {
      if (newsList[i].id == id) {
        print(i);
        newsList[i].liked = !(newsList[i].liked ?? false);
      }
    }
    notifyListeners();
  }
}
