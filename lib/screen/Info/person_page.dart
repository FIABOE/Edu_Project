// ignore_for_file: library_private_types_in_public_api

import 'package:education/screen/Info/parent_page.dart';
import 'package:flutter/material.dart';
//import 'cursus_page.dart';
import 'decis_page.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool isStudentSelected = false;
  bool isParentSelected = false;

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Qui êtes-vous ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isStudentSelected = true;
                    isParentSelected = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DecisPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: isStudentSelected ? const Color.fromARGB(255, 1, 151, 156):  const Color.fromARGB(255, 226, 243, 247), // Couleur du contour du bouton Élève
                    ),
                  ),
                  backgroundColor: isStudentSelected ? const Color.fromARGB(255, 1, 151, 156)  : Colors.transparent, // Couleur de fond du bouton Élève
                ),
                child: const Text(
                  'Élève',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isParentSelected = true;
                    isStudentSelected = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ParentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: isParentSelected ? const Color.fromARGB(255, 1, 151, 156): const Color.fromARGB(255, 226, 243, 247),// Couleur du contour du bouton Parent
                    ),
                  ),
                  backgroundColor: isParentSelected ?  const Color.fromARGB(255, 1, 151, 156)  : Colors.transparent, // Couleur de fond du bouton Parent
                ),
                child: const Text(
                  'Parent',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
