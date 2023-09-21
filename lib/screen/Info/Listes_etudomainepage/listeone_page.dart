// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ListeonePage extends StatefulWidget {
  const ListeonePage({Key? key}) : super(key: key);

  @override
  _ListeonePageState createState() => _ListeonePageState();
}

class _ListeonePageState extends State<ListeonePage> {
  List<String> itemList = [
    'Élément 1',
    'Élément 2',
    'Élément 3',
    'Élément 4',
    'Élément 5',
    'Élément 6',
    'Élément 7',
    'Élément 8',
    'Élément 9',
    'Élément 10',
    'Élément 11',
    'Élément 12',
  ];

  List<bool> checkedList = List<bool>.generate(12, (index) => false);
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'N-domaine_choisi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF70A19F),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Quel diplôme vous intéresse?\nPlusieurs choix sont possibles',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 10), // Ajuster les marges de la carte
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.grey), // Ajouter la couleur des traits horizontaux
              ),
              child: Column(
                children: itemList.map((item) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey), // Ajouter la couleur des traits horizontaux
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10), // Ajuster l'espace vertical entre les éléments
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.trailing, // Déplacer les cases à droite
                      title: Text(item),
                      value: checkedList[itemList.indexOf(item)],
                      onChanged: (value) {
                        setState(() {
                          checkedList[itemList.indexOf(item)] = value!;
                          selectedCount = checkedList.where((value) => value).length;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/EtudomainePage');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Annuler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: selectedCount > 0
                  ? () {
                      Navigator.pushReplacementNamed(context, '/EtudomainePage');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: selectedCount > 0 ? const Color(0xFF70A19F) : Colors.grey,
              ),
              child: Text(
                'Valider (${selectedCount.toString()})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
