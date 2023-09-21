// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'filière_page.dart';

class NiveauPage extends StatefulWidget {
  const NiveauPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NiveauPageState createState() => _NiveauPageState();
}

class _NiveauPageState extends State<NiveauPage> {
  List<NiveauItem> niveauList = [
    NiveauItem(
      title: 'Niveau 1',
      color: const Color(0xFFE0E0E0), // Couleur du contour pour le niveau 1
    ),
    NiveauItem(
      title: 'Niveau 2',
      color: const Color(0xFFD3D3D3), // Couleur du contour pour le niveau 2
    ),
    NiveauItem(
      title: 'Niveau 3',
      color: const Color(0xFFC0C0C0), // Couleur du contour pour le niveau 3
    ),
    // Ajoutez d'autres éléments de niveau ici
  ];

  int? selectedNiveauIndex;

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
              'Quel est votre niveau actuel ?',
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
              itemCount: niveauList.length,
              itemBuilder: (context, index) {
                final niveauItem = niveauList[index];
                final isSelected = selectedNiveauIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedNiveauIndex = isSelected ? null : index;
                    });

                    if (isSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilierePage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: niveauItem.color,
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
                          niveauItem.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
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

class NiveauItem {
  final String title;
  final Color color;

  NiveauItem({
    required this.title,
    required this.color,
  });
}


