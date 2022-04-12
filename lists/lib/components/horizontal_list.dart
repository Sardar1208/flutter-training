import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List<Map<String, Object>> list = <Map<String, Object>>[
    {
      'name': 'Item 1',
      'price': 1500,
    },
    {
      'name': 'Item 2',
      'price': 345.50,
    },
    {
      'name': 'Item 3',
      'price': 150,
    },
    {
      'name': 'Item 4',
      'price': 100,
    },
    {
      'name': 'Item 5',
      'price': 600,
    },
    {
      'name': 'Item 6',
      'price': 10,
    },
    {
      'name': 'Item 7',
      'price': 64.67,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double SCR_WIDTH = MediaQuery.of(context).size.width;

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return (ListItem(item: list[index], width: SCR_WIDTH));
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.item, this.width}) : super(key: key);

  final item;
  final width;
  final margin = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin / 2, right: margin / 2),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: const AssetImage('images/img1.jpeg'),
              width: (width / 2) - margin,
            ),
          ),
          Text(
            item['name'].toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            item['price'].toString() + '\$',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
