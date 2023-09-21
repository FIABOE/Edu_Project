// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'etudomaine_page.dart';

class DomainePage extends StatefulWidget {
  const DomainePage({Key? key}) : super(key: key);

  @override
  _DomainePageState createState() => _DomainePageState();
}

class _DomainePageState extends State<DomainePage> {
  List<DomaineItem> domaineList = [
    DomaineItem(
      title: 'Etude envisagez 1',
      color: const Color(0xFFE0E0E0), // Couleur du contour pour le domaine 1
    ),
    DomaineItem(
      title: 'Etude envisagez 2',
      color: const Color(0xFFD3D3D3), // Couleur du contour pour le domaine 2
    ),
    DomaineItem(
      title: 'Etude envisagez 3',
      color: const Color(0xFFC0C0C0), // Couleur du contour pour le domaine 3
    ),
    // Ajoutez d'autres éléments de domaine ici
  ];

  int? selectedDomaineIndex;

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
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Quelle sont vos projet pour l\'avenir ?',
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
              itemCount: domaineList.length,
              itemBuilder: (context, index) {
                final domaineItem = domaineList[index];
                final isSelected = selectedDomaineIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDomaineIndex = isSelected ? null : index;
                    });

                    if (isSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EtudomainePage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: domaineItem.color,
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
                          domaineItem.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
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

class DomaineItem {
  final String title;
  final Color color;

  DomaineItem({
    required this.title,
    required this.color,
  });
}
