import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My wishlist',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 8, 37, 80),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your wishlist is empty',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 8, 37, 80),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please reopen the book to add it to the wishlist',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 8, 37, 80),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Need inspiration?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 37, 80),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Most Wished for books by Books Depository visitors',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 8, 37, 80),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Open List',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 8, 37, 80),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber.shade400),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
