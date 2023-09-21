// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../omboard/onboarding_screen.dart';
import 'pays_page.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void showLogoutConfirmationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Déconnexion',
          style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        content: const Text(
          'Êtes-vous sûr de vouloir vous déconnecter ?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Annuler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
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
            child: const Text(
              'Se déconnecter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
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
        title: const Text(
          'D-Academy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Afin de t\'offrir un contenu adapté à tes besoins, nous avons besoin de quelques informations supplémentaires. Ne t\'inquiète pas, cela ne prendra pas beaucoup de temps, nous te le promettons.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF087B95),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 24),
            const Spacer(),
            SizedBox(
              width: 300.0,
              height: 45,
              child: ElevatedButton(
               onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PaysPage()),
                );
              },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color(0xFF70A19F),
                ),
                child: const Text(
                  'Continuer',
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
