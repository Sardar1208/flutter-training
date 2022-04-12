import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lists/components/horizontal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lists"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: const Text(
                "Horizontal List",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const HorizontalList(),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: const Text(
                "Vertical List",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              height: 400,
              child: ListView(
                children: const [
                  VerticalList(),
                  VerticalList(),
                  VerticalList(),
                  VerticalList(),
                  VerticalList(),
                  VerticalList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VerticalList extends StatelessWidget {
  const VerticalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              image: AssetImage('images/img1.jpeg'),
              width: 70,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                const Text(
                  'GeForce RTX 3090Ti',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '3000\$',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
