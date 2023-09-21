// ignore_for_file: sort_child_properties_last, unnecessary_const, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../Quiz/revision_page.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int _selectedIndex = 0; 
  String pseudo = '';
  bool avatarSelected = false;
  double progression = 0.2; // Exemple de progression (0.0 à 1.0)

  List<IconData> badgeIcons = [
  Icons.bookmark,
  Icons.star,
  Icons.label,
];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Veuillez choisir votre pseudo et votre avatar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('Pseudo:'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            pseudo = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          avatarSelected = true;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                child: const Text('Valider'),
                onPressed: (avatarSelected)
                    ? () {
                        Navigator.pop(context);
                      }
                    : null,
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF70A19F),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'D-Academy',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Action lorsque l'icône de profil est pressée
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    decoration: const BoxDecoration(
                      color: const Color(0xFF70A19F),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bienvenue $pseudo !',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Découvrez un monde d\'apprentissage interactif et amusant',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                       const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           ElevatedButton(
                            onPressed: () {

                            },
                            child: const Text(
                              'Me tester',
                              style: TextStyle(
                                color: Color.fromARGB(255, 253, 253, 253), 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold, // Mettre le texte en gras si nécessaire
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 252, 202, 145), // Changer la couleur du bouton en vert
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5), // Arrondir les bords du bouton avec un rayon de 5
                              ),
                            ),
                          ),
                            const Text(
                              'En savoir plus',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 254), // Changer la couleur du texte en bleu
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100], // Couleur de fond du cadre
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Objectifs hebdomadaires',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 16, 
                                    ),
                                    onPressed: () { 
                                  },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Stack(
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: progression,
                                  child: Container(
                                    height: 10,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 66, 146, 73),
                                          Color.fromARGB(255, 70, 206, 131),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '2 min',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 248, 232, 5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '30 min',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 248, 232, 5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ma bibliothèque',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GridView.count(
                            crossAxisCount: 3, // Nombre de cartes par ligne
                            crossAxisSpacing: 5, // Espacement horizontal réduit entre les cartes
                            mainAxisSpacing: 5, // Espacement vertical réduit entre les cartes
                            childAspectRatio: 0.8, // Rapport largeur/hauteur des cartes
                            shrinkWrap: true, // Ajuste la hauteur de GridView en fonction du contenu
                            children: [
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[100],
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fitness_center,
                                        size: 40,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Exercices',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                        // Ajoutez ici le contenu de la carte des exercices
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[100],
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.school,
                                        size: 40,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Examens',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                        // Ajoutez ici le contenu de la carte des examens
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[100],
                                      ),
                                      padding: const EdgeInsets.all(16.0),
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.book,
                                            size: 40,
                                            color: Colors.green,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Fiches',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                          ),
                                            //  Ajoutez ici le contenu de la carte des fiches
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Badges',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: badgeIcons.map((icon) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(icon, color: Colors.grey),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 12),        
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kiosque',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Accéder au kiosque',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange, // Couleur souhaitée
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100],
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                    // Ajoutez ici l'image de la première carte (partie supérieure)
                                    color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Texte première',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                            // Ajoutez ici le contenu de la première carte (partie inférieure)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100],
                              ),  
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                // Ajoutez ici l'image de la deuxième carte (partie supérieure)
                                //color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Texte deuxième',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                    // Ajoutez ici le contenu de la deuxième carte (partie inférieure)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                              // Ajoutez ici l'image de la troisième carte (partie supérieure)
                              color: Colors.orange,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Texte troisième',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                      // Ajoutez ici le contenu de la troisième carte (partie inférieure)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                // Ajoutez ici l'image de la quatrième carte (partie supérieure)
                              color: Colors.yellow,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Texte quatrième',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                    // Ajoutez ici le contenu de la quatrième carte (partie inférieure)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 7),
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                        // Action lorsque le bouton est pressé
                },
                child: const Text(
                  "S'orienter",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 134, 103),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  shadowColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
       ),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccueilPage()),
                  );
                },
              ),
              Text('Accueil', style: TextStyle(color: _selectedIndex == 0 ? Colors.blue : Colors.grey)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.library_books, color: _selectedIndex == 1 ? Colors.green : Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RevisionPage()),
                  );
                },
              ),
              Text('Révision', style: TextStyle(color: _selectedIndex == 1 ? Colors.green : Colors.grey)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.emoji_events, color: _selectedIndex == 2 ? Colors.orange : Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                          // Action pour l'icône de tournoi
                },
              ),
              Text('Tournoi', style: TextStyle(color: _selectedIndex == 2 ? Colors.orange : Colors.grey)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.star, color: _selectedIndex == 3 ? Colors.purple : Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });       // Action pour l'icône de profil
                },
              ),
              Text('Premium', style: TextStyle(color: _selectedIndex == 3 ? Colors.purple : Colors.grey)),
            ],
          ),
        ],
        ),
          ),
        ],
      ),
    );
  }
}
