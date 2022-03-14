import 'package:books_app/models/book.dart';
import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  Book book;
  BookGrid({required this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            book.imageUrl,
            height: 150,
            width: 100,
            alignment: const Alignment(-1.0, -1.0),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            book.title,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
