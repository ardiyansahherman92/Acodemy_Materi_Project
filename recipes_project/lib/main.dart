import 'package:flutter/material.dart';
import 'package:recipes_project/category_screen.dart';
import 'package:recipes_project/detail_food.dart';
import 'package:recipes_project/recipe.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/recipes': (context) => const Recipe(),
        '/detail': (context) => const DetailFood(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Recipes",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const CategoryScreen(),
    );
  }
}
