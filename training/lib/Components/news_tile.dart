import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/model/news_model.dart';
import 'package:training/model/news_provider.dart';
import 'package:training/utils/helpers.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  void changeLike(String id) {
    Provider.of<NewsList>(context, listen: false).changeLike(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.network(
                  widget.news.imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => changeLike(widget.news.id),
                    child: widget.news.liked
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
                ),
              )
            ],
          ),
          Text(
            widget.news.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.news.description,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                widget.news.source.name + " | ",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                getDate(widget.news.date),
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
