// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class EtrangerPage extends StatefulWidget {
  const EtrangerPage({Key? key}) : super(key: key);

  @override
  _EtrangerPageState createState() => _EtrangerPageState();
}

class _EtrangerPageState extends State<EtrangerPage> {
  List<String> itemList = [
    'Pays 1',
    'Pays 2',
    'Pays 3',
    'Pays 4',
    'Pays 5',
    'Pays 6',
    'Pays 7',
    'Pays 8',
    'Pays 9',
    'Pays 10',
    'Pays 11',
    'Pays 12',
  ];

  List<bool> checkedList = List<bool>.generate(12, (index) => false);
  int selectedCount = 0;

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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Choisissez vos pays',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.grey),
              ),
              child: Column(
                children: itemList.map((item) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
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
