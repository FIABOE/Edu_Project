// ignore_for_file: library_private_types_in_public_api

import 'package:education/screen/Info/tel_page.dart';
import 'package:flutter/material.dart';
import 'liste_simple/list_etat.dart';

class EtatPage extends StatefulWidget {
  final String? selectedEtat;

  const EtatPage({Key? key, this.selectedEtat}) : super(key: key);

  @override
  _EtatPageState createState() => _EtatPageState();
}

class _EtatPageState extends State<EtatPage> {
  String? selectedEtat;
  bool isButtonEnabled = false;

  void _navigateToListEtatPage() async {
    final selectedEtat = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListEtat(selectedEtat: this.selectedEtat)),
    );
    if (selectedEtat != null) {
      setState(() {
        this.selectedEtat = selectedEtat;
        isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D-Academy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Renseignez votre établissement pour\nparticiper à des compétitions!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF087B95),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: _navigateToListEtatPage,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Étatablissement',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 26, 25, 25),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          selectedEtat ?? 'Sélection',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedEtat != null
                                ?  const Color(0xFF087B95)
                                : Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Ces informations restent confidentielles. Votre établissement n\'aura pas accès à vos résultats dans l\'application.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 400.0,
              height: 45,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TelPage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor:
                      isButtonEnabled ? const Color(0xFF70A19F) : Colors.grey,
                ),
                child: const Text(
                  'Soumettre',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
