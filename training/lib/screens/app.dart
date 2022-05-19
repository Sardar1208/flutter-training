import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/Components/news_tile.dart';
import 'package:training/model/news_model.dart';
import 'package:training/model/news_provider.dart';
import 'package:training/utils/strings.dart' as strings;
import 'package:training/utils/strings.dart';
import 'package:training/view_models/provider_callback.dart';
import 'package:training/view_models/provider_handler.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  NewsList newsList = NewsList();

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    final prefs = await SharedPreferences.getInstance();
    String res;
    print(prefs.getString('apiData'));
    if (prefs.getString('apiData') != null) {
      res = prefs.getString('apiData')!;
    } else {
      final response = await http.get(Uri.parse(Strings.url));
      res = response.body;
      prefs.setString('apiData', res);
    }
    final jsonData = json.decode(res);
    providerCallback<NewsList>(
      context,
      task: (provider) {
        provider.addNews(jsonData['articles']);
      },
      taskName: (provider) => provider.GET_NEWS,
      onSuccess: (provder) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homeScreenTitle),
      ),
      body: ProviderHandler<NewsList>(
        key: UniqueKey(),
        functionName: newsList.GET_NEWS,
        showError: false,
        load: (provider) {},
        loaderBuilder: (provider) => CircularProgressIndicator(),
        errorBuilder: (provider) => Text("error"),
        successBuilder: (provider) {
          return ListView.builder(
            itemCount: provider.newsList.length,
            itemBuilder: ((context, index) {
              return NewsTile(
                news: provider.newsList[index],
              );
            }),
          );
        },
      ),
      // body: Consumer<NewsList>(
      //   builder: ((context, _provider, child) {
      //     return _provider.newsList.isNotEmpty
      //         ? ListView.builder(
      //             itemCount: _provider.newsList.length,
      //             itemBuilder: ((context, index) {
      //               return NewsTile(
      //                 news: _provider.newsList[index],
      //               );
      //             }),
      //           )
      //         : const CircularProgressIndicator();
      //   }),
      // ),
    );
  }
}
