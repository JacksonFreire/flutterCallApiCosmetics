import 'package:flutter/material.dart';
import 'package:app_jks/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lista API JKS',
      home: Home(),
    );
  }
}
