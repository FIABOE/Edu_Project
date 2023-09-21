// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'add_biblio.dart';

class StatistiquePage extends StatefulWidget {
  const StatistiquePage({Key? key}) : super(key: key);

  @override
  _StatistiquePageState createState() => _StatistiquePageState();
}

class _StatistiquePageState extends State<StatistiquePage> {
  // Liste des matières
  List<String> subjects = [
    'Matière 1',
    'Matière 2',
    'Matière 3',
    // Ajoutez d'autres matières ici
  ];

  // Liste des exercices avec leur moyenne respective
  List<Exercise> exercises = [
    Exercise(name: 'Exercice 1', average: 75),
    Exercise(name: 'Exercice 2', average: 90),
    Exercise(name: 'Exercice 3', average: 82),
    // Ajoutez d'autres exercices ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Mes statistiques par Matière',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Liste des parcours',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 161, 62, 23),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 219, 156, 96),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 252, 251, 251),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddbiblioPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      subjects[index],
                    ),
                    onTap: () {
                      // Action lors du clic sur une matière
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Moyenne par matière',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: exercises.map((exercise) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0, // Réduit l'espace vertical
                      title: Padding(
                        padding: const EdgeInsets.only(left: 2.0), // Réduit l'espace à gauche du titre
                        child: Row(
                          children: [
                            const Text(
                              '*', // Symbole *
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 245, 122, 22),
                              ),
                            ),
                            const SizedBox(width: 4), // Espace entre le symbole et le mot "Exercice"
                            Text(
                              exercise.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      trailing: Text(
                        '${exercise.average}/20',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 245, 122, 22),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}

class Exercise {
  final String name;
  final int average;

  Exercise({required this.name, required this.average});
}
