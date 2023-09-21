// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:education/screen/Info/objectif_page.dart';
import 'package:flutter/material.dart';
import 'liste_simple/list_tel.dart';

class CivilityDialog extends StatelessWidget {
  final String? selectedCivility;

  const CivilityDialog({Key? key, this.selectedCivility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sélectionnez votre civilité',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Madame'),
            onTap: () {
              Navigator.pop(context, 'Madame');
            },
            tileColor: selectedCivility == 'Madame' ? Colors.grey.shade200 : null,
          ),
          ListTile(
            title: const Text('Monsieur'),
            onTap: () {
              Navigator.pop(context, 'Monsieur');
            },
            tileColor: selectedCivility == 'Monsieur' ? Colors.grey.shade200 : null,
          ),
          ListTile(
            title: const Text('Non spécifié'),
            onTap: () {
              Navigator.pop(context, 'Non spécifié');
            },
            tileColor: selectedCivility == 'Non spécifié' ? Colors.grey.shade200 : null,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Annuler',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class TelPage extends StatefulWidget {
  final String? selectedTel;

  const TelPage({Key? key, this.selectedTel}) : super(key: key);

  @override
  _TelPageState createState() => _TelPageState();
}

class _TelPageState extends State<TelPage> {
  String? selectedTel;
  bool isButtonEnabled = false;
  String? selectedCivility;
  String? phoneNumber;

  void _navigateToListTelPage() async {
    final selectedTel = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListTel(selectedTel: this.selectedTel)),
    );
    if (selectedTel != null) {
      setState(() {
        this.selectedTel = selectedTel;
        isButtonEnabled = true;
      });
    }
  }

  void _showCivilityDialog() async {
    final selectedCivility = await showDialog<String>(
      context: context,
      builder: (context) => CivilityDialog(selectedCivility: this.selectedCivility),
    );
    if (selectedCivility != null) {
      setState(() {
        this.selectedCivility = selectedCivility;
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
            const SizedBox(height: 70),
            const Center(
              child: Text(
                'Vous y êtes presque!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF087B95),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: _showCivilityDialog,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Civilité',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 4, 4),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          selectedCivility ?? 'Sélection',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCivility != null ?  const Color(0xFF087B95) : Colors.grey,
                            fontWeight: FontWeight.bold,
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
            GestureDetector(
  onTap: () {},
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Téléphone',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 5, 4, 4),
          ),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            textAlign: TextAlign.right,
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
                isButtonEnabled = value.isNotEmpty && selectedCivility != null;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Numéro de téléphone',
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    ),
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
                      MaterialPageRoute(builder: (context) => const ObjectifPage()),
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
