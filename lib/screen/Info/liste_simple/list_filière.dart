// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class ListFiliere extends StatefulWidget {
  final String? selectedFiliere;

  const ListFiliere({Key? key, this.selectedFiliere}) : super(key: key);

  @override
  _ListFiliereState createState() => _ListFiliereState();
}

class _ListFiliereState extends State<ListFiliere> {
  List<String> filieres = [
    'Filière 1',
    'Pilière 2',
    'molière 3',
    // Ajoutez d'autres filières ici
  ];

  List<String> filteredFilieres = [];

  TextEditingController searchController = TextEditingController();

  String? selectedFiliere;

  @override
  void initState() {
    super.initState();
    filteredFilieres.addAll(filieres);
    selectedFiliere = widget.selectedFiliere;
  }

  void filterFilieres(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredFilieres.clear();
        filteredFilieres.addAll(filieres);
      });
    } else {
      List<String> filteredList = filieres
          .where((filiere) => filiere.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredFilieres.clear();
        filteredFilieres.addAll(filteredList);
      });
    }
  }

  void selectFiliere(String filiere) {
    setState(() {
      selectedFiliere = filiere;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'N-Filiere',
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
                  onChanged: filterFilieres,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Rechercher une filière',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFilieres.length,
              itemBuilder: (context, index) {
                final filiere = filteredFilieres[index];
                final isSelected = filiere == selectedFiliere;
                return ListTile(
                  title: Text(
                    filiere,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  tileColor: isSelected ? Colors.grey.shade200 : null,
                  onTap: () {
                    selectFiliere(filiere);
                    Navigator.pop(context, filiere);
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
