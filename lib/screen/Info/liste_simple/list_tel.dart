// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ListTel extends StatefulWidget {
  final String? selectedTel;

  const ListTel({Key? key, this.selectedTel}) : super(key: key);

  @override
  _ListTelState createState() => _ListTelState();
}

class _ListTelState extends State<ListTel> {
  List<String> numeros = [
    'Aucun',
    '',
    '',
    '',
    // Ajoutez d'autres numéros ici
  ];

  List<String> filteredNumeros = [];

  TextEditingController searchController = TextEditingController();

  String? selectedTel;

  @override
  void initState() {
    super.initState();
    filteredNumeros.addAll(numeros);
    selectedTel = widget.selectedTel;
  }

  void filterNumeros(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNumeros.clear();
        filteredNumeros.addAll(numeros);
      });
    } else {
      List<String> filteredList = numeros
          .where((numero) => numero.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredNumeros.clear();
        filteredNumeros.addAll(filteredList);
      });
    }
  }

  void selectTel(String numero) {
    setState(() {
      selectedTel = numero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'N-Numéro',
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
                  onChanged: filterNumeros,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Rechercher un numéro',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNumeros.length,
              itemBuilder: (context, index) {
                final numero = filteredNumeros[index];
                final isSelected = numero == selectedTel;
                return ListTile(
                  title: Text(
                    numero,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  tileColor: isSelected ? Colors.grey.shade200 : null,
                  onTap: () {
                    selectTel(numero);
                    Navigator.pop(context, numero);
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
