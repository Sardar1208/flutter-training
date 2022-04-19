import 'package:flutter/material.dart';
import 'package:training/screens/basic_screen.dart';
import 'package:training/screens/new_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: InitialRoute(
        key: key,
      ),
    );
  }
}

class InitialRoute extends StatelessWidget {
  const InitialRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasicScreen()),
              );
            },
            child: const Text("Basic"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/newpage', arguments: {
                'arg1': 'Hello!!',
                'arg2': 'I am an argument',
              });
            },
            child: const Text("Named Navigation"),
          )
        ],
      ),
    );
  }
}
