import 'package:flutter/material.dart';
import 'screen/Compte/compte_page.dart';
import 'screen/Compte/update_page.dart';
import 'screen/Homepage/accueil_page.dart';
import 'screen/Info/Listes_etudomainepage/listetwo_page.dart';
import 'screen/Info/Niveau_page.dart';
import 'screen/Info/cursus_page.dart';
import 'screen/Info/decis_page.dart';
import 'screen/Info/etat_page.dart';
import 'screen/Info/etranger_page.dart';
import 'screen/Info/etudomaine_page.dart';
import 'screen/Info/filière_page.dart';
import 'screen/Info/future_page.dart';
import 'screen/Info/intro_page.dart';
import 'screen/Info/langue_page.dart';
import 'screen/Info/mes_info.dart';
import 'screen/Info/objectif_page.dart';
import 'screen/Info/parent_page.dart';
import 'screen/Info/pays_page.dart';
import 'screen/Info/person_page.dart';
import 'screen/Info/plan_page.dart';
import 'screen/Info/relation_page.dart';
import 'screen/Info/rythme_page.dart';
import 'screen/Info/tel_page.dart';
import 'screen/omboard/onboarding_screen.dart';
import 'screen/splash/splash_screen.dart';
import 'screen/authentification/login_page.dart';
import 'screen/authentification/register_page.dart';
import 'screen/authentification/editPass.dart';
//import 'package:flutter_localization/flutter_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(key: Key('splash')),
        '/login': (context) => const LoginPage(key: Key('login')),
        '/OnboardingScreen': (context) => const OnboardingScreen(key: Key('OnboardingScreen')),
        '/register': (context) => const RegisterPage(key: Key('register')),
        '/editPass': (context) => const EditPassPage(key: Key('editPass')),
        '/IntroPage': (context) => const IntroPage(key: Key('IntroPage')),
        '/DecisPage': (context) => const DecisPage(key: Key('DecisPage')),
        '/PaysPage': (context) => const PaysPage(key: Key('PaysPage')),
        '/PersonPage': (context) => const PersonPage(key: Key('PersonPage')),
        '/NiveauPage': (context) => const NiveauPage(key: Key('NiveauPage')),
        '/FilierePage': (context) => const FilierePage(key: Key('FilierePage')),
        '/CursusPage': (context) => const CursusPage(key: Key('CursusPage')),
        '/LanguePage': (context) => const LanguePage(key: Key('LanguePage')),
        '/DomainePage': (context) => const DomainePage(key: Key('DomainePage')),
        '/EtudomainePage': (context) => const EtudomainePage(key: Key('EtudomainePage')),
        '/RythmePage': (context) => const RythmePage(key: Key('RythmePage')),
        '/ListetwoPage': (context) => const ListetwoPage(key: Key('ListetwoPage')),
        '/PlanPage': (context) => const PlanPage(key: Key('PlanPage')),
        '/RelationPage': (context) => const RelationPage(key: Key('RelationPage')),
         '/EtatPage': (context) => const EtatPage(key: Key('EtatPage')),
         '/TelPage': (context) => const TelPage(key: Key('TelPage')),
         '/EtrangerPage': (context) => const EtrangerPage(key: Key('EtrangerPage')),
         '/MesinfoPage': (context) => const MesinfoPage(key: Key('MesinfoPage')),
         '/ObjectifPage': (context) => const ObjectifPage(key: Key('ObjectifPage')),
         '/ParentPage': (context) => const ParentPage(key: Key('ParentPage')),
         '/AccueilPage': (context) => const AccueilPage(key: Key('AccueilPage')),
         '/ComptePage': (context) => const ComptePage(),
         '/UpdateComptePage': (context) => const UpdateComptePage(),

      },
    );
  }
}
