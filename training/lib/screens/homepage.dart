import 'package:flutter/material.dart';
import 'dart:math';

import 'package:training/screens/details_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color color = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures and animations'),
      ),
      body: Center(
        child: Column(
          children: const [
            Item(name: 'img1'),
            Item(name: 'img2'),
            Item(name: 'img3'),
            Item(name: 'img4'),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(key: key, name: name),
                ));
          },
          child: Hero(
            tag: name,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'images/img1.jpeg',
                width: 150,
                height: 150,
              ),
            ),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "List Item",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "This is a small description about this item.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
