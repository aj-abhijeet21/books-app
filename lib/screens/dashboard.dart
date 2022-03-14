import 'package:books_app/screens/favorites.dart';
import 'package:books_app/screens/home_page.dart';
import 'package:books_app/screens/bookstores.dart';
import 'package:books_app/screens/search_book.dart';
import 'package:books_app/screens/categories.dart';
import 'package:books_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    HomePage(),
    Bookstores(),
    SearchBook(),
    Categories(),
    Favorites(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Books Apps'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.lightBlue.shade300, Colors.blue.shade800],
            ),
          ),
        ),
      ),
      drawer: drawer(),
      bottomNavigationBar: BottomNavBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/library.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Books App',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text('Bookstores'),
            leading: Icon(Icons.store_mall_directory_outlined),
          ),
          ListTile(
            title: Text('Book Depository'),
            leading: Icon(Icons.my_library_books_sharp),
          ),
        ],
      ),
    );
  }
}
