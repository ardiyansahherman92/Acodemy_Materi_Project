import 'package:flutter/material.dart';
import 'package:lottie_app/lottie.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Lottie(),
    );
  }
}
