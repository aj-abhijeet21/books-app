import 'package:books_app/screens/dashboard.dart';
import 'package:books_app/screens/search_results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/search': (context) => SearchResults(),
      },
    );
  }
}
