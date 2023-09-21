// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class EditPassPage extends StatefulWidget {
  const EditPassPage({Key? key});

  @override
  _EditPassPageState createState() => _EditPassPageState();
}

class _EditPassPageState extends State<EditPassPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;
  final TextEditingController _emailController = TextEditingController();

  void _updateFormValidity() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding( 
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Mot de passe oublié?',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: _updateFormValidity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'D-Academy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF087B95),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Consolider vos acquis via notre \nApp d’éducation',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              const Text(
                'Veuillez entrer votre adresse e-mail pour réinitialiser votre mot de passe. Merci !',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF087B95), // Couleur personnalisée (bleu par exemple)
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre adresse e-mail.';
                  }
                  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Veuillez entrer une adresse e-mail valide.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Spacer(),
              SizedBox(
                width: 400.0, // Largeur du bouton fixée à 300.0
                height: 45,
                child: ElevatedButton(
                  onPressed: _isFormValid
                      ? () {
                          // Actions lorsque l'utilisateur appuie sur "Soumettre" et que les champs sont valides
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: _isFormValid ? const Color(0xFF70A19F) : Colors.grey, // Changement de couleur du bouton
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
      ),
    );
  }
}
