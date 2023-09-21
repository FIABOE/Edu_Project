// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'intro_page.dart';
import 'person_page.dart';

class PaysPage extends StatefulWidget {
  const PaysPage({Key? key}) : super(key: key);

  @override
  _PaysPageState createState() => _PaysPageState();
}

class _PaysPageState extends State<PaysPage> {
  String? selectedCountry; // Changer le type en String nullable
  List<String> countries = [
    'Togo',
    'Ghana',
    'France',
    'Allemagne',
    'Espagne',
    'Italie',
    'Royaume-Uni',
  ];
  Color selectedCountryTextColor = const Color(0xFF087B95); // Couleur personnalisée pour les pays sélectionnés
  bool isButtonEnabled = false;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredCountries = countries.where((country) {
      return country.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const IntroPage()),
            );
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
              'Quel est votre pays de résidence ?',
              style: TextStyle(
                fontSize: 20,
                 fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CountrySearchDelegate(
                    countries: countries,
                    onSelectCountry: (country) {
                      setState(() {
                        selectedCountry = country;
                        isButtonEnabled = true;
                      });
                    },
                  ),
                );
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  hintText: 'Sélection',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pays',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          selectedCountry ?? 'Sélection',
                          style: TextStyle(
                            color: selectedCountry != null ? selectedCountryTextColor : Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Ajout de la propriété fontWeight
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Spacer(),
            SizedBox(
              width: 400.0,
              height: 45,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PersonPage()),
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class CountrySearchDelegate extends SearchDelegate<String> {
  final List<String> countries;
  final Function(String) onSelectCountry;

  CountrySearchDelegate({required this.countries, required this.onSelectCountry});

  @override
  String get searchFieldLabel => 'Recherche';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Pas besoin de cette méthode pour la recherche des pays
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filteredCountries = countries.where((country) {
      return country.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredCountries.length,
      itemBuilder: (BuildContext context, int index) {
        final country = filteredCountries[index];
        return ListTile(
          title: Text(country),
          onTap: () {
            onSelectCountry(country);
            close(context, country);
          },
        );
      },
    );
  }
}
