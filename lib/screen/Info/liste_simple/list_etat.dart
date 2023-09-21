// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ListEtat extends StatefulWidget {
  final String? selectedEtat;

  const ListEtat({Key? key, this.selectedEtat}) : super(key: key);

  @override
  _ListEtatState createState() => _ListEtatState();
}

class _ListEtatState extends State<ListEtat> {
  List<String> etats = [
    'Aucun',
    'Etat 1',
    'Tat 2',
    'At 3',
    // Ajoutez d'autres états ici
  ];

  List<String> filteredEtats = [];

  TextEditingController searchController = TextEditingController();

  String? selectedEtat;

  @override
  void initState() {
    super.initState();
    filteredEtats.addAll(etats);
    selectedEtat = widget.selectedEtat;
  }

  void filterEtats(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredEtats.clear();
        filteredEtats.addAll(etats);
      });
    } else {
      List<String> filteredList = etats
          .where((etat) => etat.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredEtats.clear();
        filteredEtats.addAll(filteredList);
      });
    }
  }

  void selectEtat(String etat) {
    setState(() {
      selectedEtat = etat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'N-Etat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF70A19F),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: filterEtats,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Rechercher un état',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEtats.length,
              itemBuilder: (context, index) {
                final etat = filteredEtats[index];
                final isSelected = etat == selectedEtat;
                return ListTile(
                  title: Text(
                    etat,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  tileColor: isSelected ? Colors.grey.shade200 : null,
                  onTap: () {
                    selectEtat(etat);
                    Navigator.pop(context, etat);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
