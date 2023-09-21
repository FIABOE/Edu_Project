// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'rythme_page.dart';

class EtudomainePage extends StatefulWidget {
  const EtudomainePage({Key? key}) : super(key: key);

  @override
  _EtudomainePageState createState() => _EtudomainePageState();
}

class _EtudomainePageState extends State<EtudomainePage> {
  List<String> domaineList = [
    'Domaine 1',
    'Domaine 2',
    'Domaine 3',
    'Domaine 4',
    'Domaine 5',
    'Domaine 6',
    'Domaine 3',
    'Domaine 4',
    'Domaine 5',
    'Domaine 6',
  ];

  List<int> selectedDomaineIndexes = [];
  bool isButtonEnabled = false;

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
          const SizedBox(height: 40),
          const Center(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Quels domaines d\'études\nvous intéressent?',
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 16, // Espace horizontal entre les cartes
                  mainAxisSpacing: 16, // Espace vertical entre les cartes
                  childAspectRatio: 2,
                ),
                itemCount: domaineList.length,
                itemBuilder: (context, index) {
                  final domaine = domaineList[index];
                  final isSelected = selectedDomaineIndexes.contains(index);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDomaineIndexes.remove(index);
                        } else {
                          selectedDomaineIndexes.add(index);
                        }
                        isButtonEnabled = selectedDomaineIndexes.isNotEmpty;
                      });
                    },
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
                            domaine,
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
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
                          MaterialPageRoute(builder: (context) => const RythmePage()),
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
