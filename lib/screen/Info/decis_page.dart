// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'cursus_page.dart';

class DecisPage extends StatefulWidget {
  const DecisPage({Key? key}) : super(key: key);

  @override
  _DecisPageState createState() => _DecisPageState();
}

class _DecisPageState extends State<DecisPage> {
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
              'Veuillez prendre soin de sélectionner attentivement votre cursus, car il ne pourra pas être modifié ultérieurement.',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF087B95), 
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 24),
            const Spacer(),
            SizedBox(
              width: 400.0,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => const CursusPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Modifier la valeur pour ajuster le rayon de courbure des bords
                  ),
                  backgroundColor: const Color(0xFF70A19F), // Changer la couleur du bouton ici
                ),
                child: const Text(
                  'Continuer',
                  style: TextStyle(
                    fontSize: 18,
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
