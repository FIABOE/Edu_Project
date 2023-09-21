// ignore_for_file: depend_on_referenced_packages, unused_import, unused_element, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datepicker_cupertino/datepicker_cupertino.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import '../Info/intro_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _acceptTerms = false;
  bool _obscureText = true;
  String? _errorMessage;

  DateTime? _selectedDate;

  void _updateFormValidity() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
      _isFormValid = _isFormValid && _acceptTerms;
    });
  }


  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _validateDateOfBirth(String? value) {
  if (value == null || value.isEmpty) {
    return 'Veuillez choisir votre date de naissance.';
  }

  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.parse(value);

  String errorMessage =
      'Vous avez moins de 15 ans ! Il est préférable que vos parents ou tuteurs remplissent le formulaire pour vous. Merci.';

  if (currentDate.year - selectedDate.year < 15 ||
      (currentDate.year - selectedDate.year == 15 &&
          currentDate.month < selectedDate.month) ||
      (currentDate.year - selectedDate.year == 15 &&
          currentDate.month == selectedDate.month &&
          currentDate.day < selectedDate.day)) {
    // Supprimer la première occurrence du message d'erreur
    if (_errorMessage == errorMessage) {
      return null;
    }
    return errorMessage;
  }
  return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre adresse email.';
    }
    // Utilisez une expression régulière pour valider le format de l'email
    // Voici un exemple simple, vous pouvez le modifier selon vos besoins
    bool isValidEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+)$')
        .hasMatch(value);
    if (!isValidEmail) {
      return 'Veuillez entrer une adresse email valide.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Veuillez entrer votre mot de passe.';
  }
  if (value.length < 8) {
    return 'Le mot de passe doit comporter au moins 8 caractères.';
  }
  return null;
}
  

  void _showErrorDialog(String errorMessage) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: const Text('Erreur'),
        content: Text(errorMessage),
        actions: <Widget>[
          BasicDialogAction(
            title: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final DateTime? selectedDateTime =
        await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter, //Alignement en bas de la page
            child: Container(
              height: 200,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          _selectedDate = newDateTime;
                          _dateController.text = _selectedDate!
                              .toIso8601String()
                              .split('T')[0];
                          _errorMessage =
                              _validateDateOfBirth(_dateController.text);
                          _updateFormValidity();
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 15, 177, 185),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (selectedDateTime != null) {
      setState(() {
        _selectedDate = selectedDateTime;
        _dateController.text = _selectedDate!.toString();
        _errorMessage = _validateDateOfBirth(_dateController.text);
        _updateFormValidity();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Inscrivez-vous',
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
      body: Form(
        key: _formKey,
        onChanged: _updateFormValidity,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const Text(
              'D-Academy',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF087B95),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pour accéder à ce service, il est nécessaire d’avoir 15 ans ou d’obtenir l’autorisation d’un parent.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                _showDatePicker();
              },
              child: AbsorbPointer(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date de naissance',
                        suffixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: _validateDateOfBirth,
                    ),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Prénom',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom.';
                }
                if (value.length == 1) {
                  return 'Le prénom doit comporter plus d\'une lettre.';
                }
                if (RegExp(r'[0-9]').hasMatch(value)) {
                  return 'Le prénom ne doit pas contenir de chiffres.';
                }
                return null;
              },
            ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _surnameController,
            decoration: const InputDecoration(
              labelText: 'Nom',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre nom.';
              }
              if (value.length == 1) {
                return 'Le nom doit comporter plus d\'une lettre.';
              }
              if (RegExp(r'[0-9]').hasMatch(value)) {
                return 'Le nom ne doit pas contenir de chiffres.';
              }
              return null;
            },
          ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre adresse email.';
                }
                // Vérification de la validité de l'email
                final emailRegex = RegExp(
                    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Veuillez entrer une adresse email valide.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
              ),
              obscureText: _obscureText,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe.';
                }
                if (value.length < 8) {
                  return 'Le mot de passe doit comporter au moins 8 caractères.';
                }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Confirmez votre mot de passe',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            obscureText: _obscureText,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez confirmer votre mot de passe.';
              }
              if (value != _passwordController.text) {
                return 'Les mots de passe ne correspondent pas.';
              }
            return null;
            },
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                      _updateFormValidity();
                    });
                  },
                ),
                const Flexible(
                child: Text(
                  'J’accepte les conditions Générales d’utilisation de D-Academy. Vous bénéficiez d’un droit d’accès, d’information, de rectification, d’effacement, de limitation, d’opposition et de portabilité aux informations collectées.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              ],
            ),
            //const SizedBox(height: 16),
            const SizedBox(height: 16),
            const SizedBox(height: 100),
            SizedBox(
              width: 300.0,
              height: 45,
              child: ElevatedButton(
                onPressed: _isFormValid ? _register : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: _isFormValid ? const Color(0xFF70A19F): Colors.grey,
                ),
                child: const Text(
                  'Soumettre',
                  style: TextStyle(
                    fontSize: 20,
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

 void _register() {
  // Récupérer les valeurs des champs du formulaire
  //String dateOfBirth = _dateController.text;
  //String name = _nameController.text;
  //String surname = _surnameController.text;
  //String email = _emailController.text;
  //String password = _passwordController.text;

  // Effectuer la logique d'enregistrement ici
  // Par exemple, envoyer une requête HTTP POST au serveur avec les données
  // et gérer les réponses en conséquence

  // Afficher une boîte de dialogue de succès après l'enregistrement
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text(
        'Inscription réussie',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
      ),
      content: const Text(
        'Vous êtes maintenant inscrit.',
      style: TextStyle(
            fontSize: 18,
              fontWeight: FontWeight.w400,
            )
      ),
       actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IntroPage()),
            );
          },
          child: const Text(
            'OK',
            style: TextStyle(
               fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}


}
