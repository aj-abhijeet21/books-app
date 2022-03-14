import 'dart:convert';

import 'package:books_app/models/book.dart';
import 'package:dio/dio.dart';

// AIzaSyAZCU5kM1Sxc_j-BiEkN1PqaSzNs88dqKc

// https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=AIzaSyAZCU5kM1Sxc_j-BiEkN1PqaSzNs88dqKc

// https://www.googleapis.com/books/v1/volumes?q=harry+intitle:harry&key=AIzaSyAZCU5kM1Sxc_j-BiEkN1PqaSzNs88dqKc

class BookService {
  // Future searchBook(String title) async {
  Future<List<Book>> searchBook(String title) async {
    var dio = Dio();
    String url = 'https://www.googleapis.com/books/v1/volumes';
    var response = await dio.get(url, queryParameters: {
      'q': '$title+intitle:$title',
      'key': 'AIzaSyAZCU5kM1Sxc_j-BiEkN1PqaSzNs88dqKc'
    });

    List<Book> bookList = [];
    try {
      // print(response.data['items']);
      var jsonData = response.data['items'] as List;

      jsonData.forEach((book) {
        bookList.add(Book.fromJson(book));
      });

      // var books = Map.from(jsonData['items']);

      print(bookList.length);
    } catch (e) {
      print(e);
    }
    // books.forEach((book) {
    //   bookList.add(Book.fromJson(book));
    // });

    // print(bookList.length);

    return bookList;
  }
}
