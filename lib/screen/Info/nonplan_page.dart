// ignore_for_file: library_private_types_in_public_api

import 'package:education/screen/Info/etat_page.dart';
import 'package:education/screen/Info/plan_page.dart';
import 'package:flutter/material.dart';

import 'relation_page.dart';

class NonplanPage extends StatefulWidget {
  const NonplanPage({Key? key}) : super(key: key);

  @override
  _NonplanPageState createState() => _NonplanPageState();
}

class _NonplanPageState extends State<NonplanPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Souhaitez-vous recevoir les bons plans de nos partenaires ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95), // Couleur personnalisée (bleu par exemple)
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => const PlanPage()),
                  );
                    // Action lorsque l'utilisateur choisit "Oui"
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: const Color(0xFF70A19F),
                  ),
                  child: const Text(
                    'Oui',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EtatPage()),
                  );
                    // Action lorsque l'utilisateur choisit "Non"
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text(
                    'Non',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
