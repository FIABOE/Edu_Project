// ignore_for_file: library_private_types_in_public_api

import 'package:education/screen/Info/nonplan_page.dart';
import 'package:flutter/material.dart';


class RythmePage extends StatefulWidget {
  const RythmePage({Key? key}) : super(key: key);

  @override
  _RythmePageState createState() => _RythmePageState();
}

class _RythmePageState extends State<RythmePage> {
  List<String> rythmeList = [
    'Formation initiale / à temps plein',
    'Alternance / stage',
    'A l\'étranger',
    'A distance',
  ];

  List<int> selectedRythmeIndexes = []; // Liste des index des rythmes sélectionnés
  bool isButtonEnabled = false; // État du bouton, par défaut désactivé

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
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Quels rythmes de formation \nenvisagez-vous ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF087B95),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 4, // Définir l'aspect ratio des rectangles ici
                ),
                itemCount: rythmeList.length,
                itemBuilder: (context, index) {
                  final rythme = rythmeList[index];
                  final isSelected = selectedRythmeIndexes.contains(index);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedRythmeIndexes.remove(index);
                        } else {
                          selectedRythmeIndexes.add(index);
                        }
                        isButtonEnabled = selectedRythmeIndexes.isNotEmpty;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Ajout d'un espace autour de la carte
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Colors.white : Colors.grey,
                            width: isSelected ? 2.0 : 1.0,
                          ),
                          color: isSelected ? const Color(0xFF70A19F) : Colors.transparent,
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book,
                              size: 30,
                              color: isSelected ? Colors.white : const Color.fromARGB(255, 66, 92, 92),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              rythme,
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NonplanPage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: isButtonEnabled ? const Color(0xFF70A19F) : Colors.grey,
                ),
                child: const Text(
                  'Soumettre',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
