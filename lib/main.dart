import 'package:apobat/List_Vitamin/DetailVitamin.dart';
import 'package:apobat/Page/Landing_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/auth.dart';
import 'package:apobat/firebase_options.dart';
import 'List_Anak/DetailAnak.dart';
import 'List_Batuk/DetailBatuk.dart';
import 'List_Demam/DetailDemam.dart';
import 'List_Flu/DetailFlu.dart';
import 'List_Maag/DetailMaag.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthPage.routeName,
      routes: {
        AuthPage.routeName: (context) => const AuthPage(),
        Landing_Page.routeName: (context) => Landing_Page(),
        DetailFlu.routeName: (context) => DetailFlu(
            id: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
        DetailVitamin.routeName: (context) => DetailVitamin(
            id: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
        DetailBatuk.routeName: (context) => DetailBatuk(
            id: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
        DetailDemam.routeName: (context) => DetailDemam(
            id: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
        DetailAnak.routeName: (context) => DetailAnak(
            id: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
        DetailMaag.routeName: (context) => DetailMaag(
            id: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
      },
    );
  }
}
