import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CategoryRow(category1: 'Fiction', category2: 'Religion'),
        CategoryRow(category1: 'Romance', category2: 'Biography'),
        CategoryRow(category1: 'Children\'s Books', category2: 'Medical'),
        CategoryRow(category1: 'Crime & Thriller', category2: 'Computing'),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Book Categories',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 8, 37, 80),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amber.shade400),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  String category1;
  String category2;
  CategoryRow({
    required this.category1,
    required this.category2,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            child: Center(
              child: Text(
                category1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            child: Center(
              child: Text(
                category2,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
