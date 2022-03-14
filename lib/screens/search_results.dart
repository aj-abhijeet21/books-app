import 'package:books_app/models/book.dart';
import 'package:books_app/services/api_service.dart';
import 'package:books_app/widgets/bookTile.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String query = arguments['searchQuery'];

    return Scaffold(
      body: FutureBuilder<List<Book>>(
        future: BookService().searchBook(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            // return Text('data laoded');
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BookTile(book: snapshot.data![index]);
                // return ListTile(
                //   title: Text(snapshot.data![index].title),
                // );
              },
            );
          }
        },
      ),
    );
  }
}
