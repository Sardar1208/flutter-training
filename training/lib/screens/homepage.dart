import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training/post_modal.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Post>> getPost() async {
  final response = await http.get(Uri.parse('$url'));

  var res = postFromJson(response.body);
  return res;
}

class _HomepageState extends State<Homepage> {
  bool loading = true;
  List<Post> data = [];

  @override
  void initState() {
    super.initState();
    getPostData();
  }

  void getPostData() {
    getPost().then((value) {
      setState(() {
        loading = false;
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch data and display list'),
        ),
        body: Container(
          child: loading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        data[index].title.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }),
        ));
  }
}
