// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:education/screen/Info/etat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class RelationPage extends StatefulWidget {
  const RelationPage({Key? key}) : super(key: key);

  @override
  _RelationPageState createState() => _RelationPageState();
}

class _RelationPageState extends State<RelationPage> {
  var maskedPostalCodeController = MaskedTextController(mask: '00000');
  bool isButtonEnabled = false;
  bool isCheckboxChecked = false;

  @override
  void dispose() {
    maskedPostalCodeController.dispose();
    super.dispose();
  }

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
              'Quel est votre code postal ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: maskedPostalCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Code postal',
                hintText: '00000',
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black), // Couleur du texte "Code postal"
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: maskedPostalCodeController.text.isEmpty
                        ? Colors.transparent
                        : Colors.red, // Couleur des chiffres "00000"
                  ),
                  onPressed: () {
                    maskedPostalCodeController.clear();
                    setState(() {
                      isButtonEnabled = false;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isButtonEnabled = maskedPostalCodeController.text.length == 5;
                });
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCheckboxChecked
                        ? const Color(0xFF70A19F)
                        : Colors.transparent,
                    border: Border.all(color: const Color(0xFF70A19F)),
                  ),
                  child: Checkbox(
                    value: isCheckboxChecked,
                    onChanged: (value) {
                      setState(() {
                        isCheckboxChecked = value ?? false;
                      });
                    },
                    activeColor: Colors.transparent,
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Je donne mon accord pour que mes informations personnelles soient recueillies dans le but d\'établir des connexions avec des établissements scolaires ou des organisations liées à la vie.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF087B95),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EtatPage()),
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
