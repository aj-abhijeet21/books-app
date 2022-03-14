import 'package:books_app/models/book.dart';
import 'package:books_app/services/api_service.dart';
import 'package:books_app/widgets/bookTile.dart';
import 'package:flutter/material.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({Key? key}) : super(key: key);

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  List<Book> list = [];
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
                  setState(() {
                    query = searchController.text.trim();
                  });
                  // list = await BookService().searchBook(query);

                  Navigator.pushNamed(context, '/search',
                      arguments: {'searchQuery': query});
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
          Text('Search for a book'),

          // FutureBuilder<List<Book>>(
          //   future: BookService().searchBook(query),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Text(
          //           snapshot.error.toString(),
          //         ),
          //       );
          //     } else {
          //       // return Text('data laoded');
          //       return ListView.builder(
          //         physics: NeverScrollableScrollPhysics(),
          //         itemCount: snapshot.data!.length,
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           return BookTile(book: snapshot.data![index]);
          //           // return ListTile(
          //           //   title: Text(snapshot.data![index].title),
          //           // );
          //         },
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
