// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../omboard/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  final String?
      routeName; // Utilisez "final" au lieu de "var" pour déclarer la variable

  const SplashScreen({Key? key, this.routeName})
      : super(key: key); // Utilisez "Key? key" au lieu de "super.key"

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = const Duration(seconds: 5);
    // delayed 3 seconds to do something
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OnboardingScreen();
          },
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/girl3.jpg'),
            //girl
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'D-Academy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Solutions mobiles pour l\'apprentissage universel',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
