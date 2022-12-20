import 'package:bazara_tecnical_test/src/pages/contact/CreateContactPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateContactPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
