import 'package:flutter/material.dart';

class Bookstores extends StatelessWidget {
  List<String> bookstores = [
    'Book Depository',
    'Blackwells Books',
    'Better World Books',
    'Fishpond.com',
    'Wordery',
  ];
  List<String> otherstores = [
    'Amazon.com',
    'Amazon UK',
    'AbeBooks.com(marketplace)',
    'AbeBooks.co.uk(marketplace)',
    'Biblio.com',
    'Alibris.co.uk(marketplace)',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Bookstores : free shipping',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bookstores.length,
            itemBuilder: ((context, index) {
              return DepositoryCard(
                depositoryName: bookstores[index],
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Other Popular Bookstores',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: otherstores.length,
            itemBuilder: ((context, index) {
              return DepositoryCard(
                depositoryName: otherstores[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class DepositoryCard extends StatelessWidget {
  String depositoryName;
  DepositoryCard({required this.depositoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      child: Text(
        depositoryName,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue.shade900,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
