// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Niveau_page.dart';

class CursusPage extends StatefulWidget {
  const CursusPage({Key? key}) : super(key: key);

  @override
  _CursusPageState createState() => _CursusPageState();
}

class _CursusPageState extends State<CursusPage> {
  List<CursusItem> cursusList = [
    CursusItem(
      title: 'Cursus 1',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
    CursusItem(
      title: 'Cursus 2',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
    CursusItem(
      title: 'Cursus 3',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
   
  ];

  CursusItem? selectedCursus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'D-Academy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF70A19F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Quel est votre cursus actuel ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cursusList.length,
              itemBuilder: (context, index) {
                final cursusItem = cursusList[index];
                final isSelected = selectedCursus == cursusItem;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCursus = isSelected ? null : cursusItem;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NiveauPage(), // 
                        ),
                      );
                    },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? const Color.fromARGB(255, 121, 155, 161) : Colors.white,
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: const Color.fromARGB(255, 169, 210, 243).withOpacity(0.6),
                            blurRadius: 10,
                            spreadRadius: 3,
                          ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(cursusItem.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cursusItem.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  cursusItem.description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CursusItem {
  final String title;
  final String description;
  final String imageUrl;

  CursusItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
