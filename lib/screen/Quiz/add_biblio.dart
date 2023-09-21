import 'package:flutter/material.dart';

class AddbiblioPage extends StatefulWidget {
  const AddbiblioPage({Key? key}) : super(key: key);

  @override
  _AddbiblioPageState createState() => _AddbiblioPageState();
}

class _AddbiblioPageState extends State<AddbiblioPage> {
  List<String> exercises = [
    'Parcours 1',
    'Parcours 2',
    'Parcours 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Parcours',
          textAlign: TextAlign.center,
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
            const SizedBox(height: 8),
            const Text(
              '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 26, 139, 143),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 231, 198, 52),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      // Action à effectuer lorsque l'icône d'ajout est pressée
                    },
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Ajouter à ma bibliothèque',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    leading: Text(
                      exercises[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        // Action à effectuer lorsque l'icône de suppression est pressée
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
