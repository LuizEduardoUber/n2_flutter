import 'package:flutter/material.dart';
import 'firebase_connection_page.dart';
import '/medication_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Medicações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirebaseConnectionPage(),
        '/medicationList': (context) => MedicationListPage(),
      },
    );
  }
}
