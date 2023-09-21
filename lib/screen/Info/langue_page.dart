// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LanguePage extends StatefulWidget {
  const LanguePage({Key? key}) : super(key: key);

  @override
  _LanguePageState createState() => _LanguePageState();
}

class _LanguePageState extends State<LanguePage> {
  List<LangueItem> langueList = [
    LangueItem(
      title: 'Langue 1',
      color: const Color(0xFFE0E0E0), // Couleur du contour pour la langue 1
    ),
    LangueItem(
      title: 'Langue 2',
      color: const Color(0xFFD3D3D3), // Couleur du contour pour la langue 2
    ),
    LangueItem(
      title: 'Langue 3',
      color: const Color(0xFFC0C0C0), // Couleur du contour pour la langue 3
    ),
    // Ajoutez d'autres éléments de langue ici
  ];

  int? selectedLangueIndex;

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
              'Dans Quelle langue aimeriez \nVous réviser ?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF087B95),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: langueList.length,
              itemBuilder: (context, index) {
                final langueItem = langueList[index];
                final isSelected = selectedLangueIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLangueIndex = isSelected ? null : index;
                    });
                    if (isSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LanguePage()),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: langueItem.color,
                        width: 2.0,
                      ),
                      color: isSelected ? const Color(0xFF70A19F) : Colors.white,
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          langueItem.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

class LangueItem {
  final String title;
  final Color color;

  LangueItem({
    required this.title,
    required this.color,
  });
}
