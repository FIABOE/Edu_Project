// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

import '../Homepage/accueil_page.dart';
import '../omboard/onboarding_screen.dart';

class MesinfoPage extends StatefulWidget {
  const MesinfoPage({Key? key}) : super(key: key);

  @override
  _MesinfoPageState createState() => _MesinfoPageState();
}

class _MesinfoPageState extends State<MesinfoPage> {
  List<InfoItem> userInfos = [
    InfoItem(label: 'Prénom', value: 'irene', color:  const Color(0xFF087B95)),
    
    InfoItem(label: 'Nom', value: 'fiaboe', color:  const Color(0xFF087B95)),
    InfoItem(label: 'Email', value: 'irend@example.com', color: Colors.blue),
    InfoItem(label: 'Date de naissance', value: '01/01/1990', color: Colors.blue),
    InfoItem(label: 'Pays', value: 'togo', color: Colors.blue),
    InfoItem(label: 'Membre', value: 'Oui', color: Colors.blue),
    InfoItem(label: 'Cursus', value: 'Informatique', color: Colors.blue),
    InfoItem(label: 'Nom filière', value: 'Génie logiciel', color: Colors.blue),
    InfoItem(label: 'Choix pour l\'an prochain', value: 'Option A', color: Colors.blue),
    InfoItem(label: 'Domaines d\'étude', value: 'Développement mobile', color: Colors.blue),
    InfoItem(label: 'Type d\'études', value: 'Master', color: Colors.blue),
    InfoItem(label: 'Intéressé(e) par', value: 'Intelligence artificielle', color: Colors.blue),
    InfoItem(label: 'Mise en relation', value: 'Oui', color: Colors.blue),
    InfoItem(label: 'Code postal', value: '12345', color: Colors.blue),
    InfoItem(label: 'Établissement', value: 'Université XYZ', color: Colors.blue),
    InfoItem(label: 'Civilité', value: 'Non spécifier', color: Colors.blue),
    InfoItem(label: 'Téléphone', value: '1234567890', color: Colors.blue),
    InfoItem(label: 'Objectif', value: ' je révise 30min ', color: Colors.blue),
  ];

  void showLogoutConfirmationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text('Déconnecter'),
          ),
        ],
      );
    },
  );
}



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
        leading: GestureDetector(
          onTap: () {
            showLogoutConfirmationDialog();
          },
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CustomPaint(
              size: const Size(24, 24),
              painter: CrossPainter(
                color: const Color(0xFF70A19F),
                strokeWidth: 2.0,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Veuillez vérifier vos informations \net les mettre à jour si nécessaire:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: userInfos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            userInfos[index].label,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              userInfos[index].value,
                              style: TextStyle(
                                color: userInfos[index].color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => const AccueilPage()),
                  );
                  
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF70A19F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
              ),
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}

class CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CrossPainter({
    required this.color,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    canvas.drawCircle(
      Offset(centerX, centerY),
      radius,
      paint,
    );

    canvas.drawLine(
      Offset(centerX - radius / 2, centerY - radius / 2),
      Offset(centerX + radius / 2, centerY + radius / 2),
      paint,
    );
    canvas.drawLine(
      Offset(centerX - radius / 2, centerY + radius / 2),
      Offset(centerX + radius / 2, centerY - radius / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class InfoItem {
  final String label;
  final String value;
  final Color color;

  InfoItem({required this.label, required this.value, required this.color});
}
