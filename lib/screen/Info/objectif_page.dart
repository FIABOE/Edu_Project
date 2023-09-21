// ignore_for_file: library_private_types_in_public_api

import 'package:education/screen/Info/mes_info.dart';
import 'package:flutter/material.dart';


class ObjectifPage extends StatefulWidget {
  const ObjectifPage({Key? key}) : super(key: key);

  @override
  _ObjectifPageState createState() => _ObjectifPageState();
}

class _ObjectifPageState extends State<ObjectifPage> {
  List<ObjectifItem> objectifList = [
    ObjectifItem(
      title: 'Je révise 1h30/semaine',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
    ObjectifItem(
      title: 'Je révise 1h/semaine',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
    ObjectifItem(
      title: 'Je révise 30min/semaine',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
   ObjectifItem(
      title: 'Je révise 15min/semaine',
      description: '',
      imageUrl: 'assets/images/te.png',
    ),
  ];

  ObjectifItem? selectedObjectif;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Quel est votre objectif ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: objectifList.length,
              itemBuilder: (context, index) {
                final objectifItem = objectifList[index];
                final isSelected = selectedObjectif == objectifItem;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedObjectif = isSelected ? null : objectifItem;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MesinfoPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? const Color.fromARGB(255, 121, 155, 161) : Colors.white,
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: const Color.fromARGB(255, 169, 210, 243).withOpacity(0.6),
                            blurRadius: 10,
                            spreadRadius: 3,
                          ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(objectifItem.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  objectifItem.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  objectifItem.description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ObjectifItem {
  final String title;
  final String description;
  final String imageUrl;

  ObjectifItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
