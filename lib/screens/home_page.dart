import 'package:books_app/models/book.dart';
import 'package:books_app/services/api_service.dart';
import 'package:books_app/widgets/bookGrid.dart';
import 'package:books_app/widgets/bookTile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String query = '';
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Enter a book name...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amber.shade400),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  fixedSize: MaterialStateProperty.all(const Size(50, 60)),
                ),
                onPressed: () async {
                  query = searchController.text.trim();
                  String filter = 'no-filter';
                  Navigator.pushNamed(context, '/search', arguments: {
                    'searchQuery': query,
                    'filter': filter,
                  });
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
          FutureBuilder<List<Book>>(
            future: BookService().searchBook(query, 'no-filter'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Something happened',
                  ),
                );
              } else {
                // return Text('data laoded');
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BookGrid(book: snapshot.data![index]);
                    // return ListTile(
                    //   title: Text(snapshot.data![index].title),
                    // );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
