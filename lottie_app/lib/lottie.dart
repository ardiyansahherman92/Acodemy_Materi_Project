import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lottie extends StatelessWidget {
  const Lottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Animated"),
      ),
      body: Center(
        child: LottieBuilder.asset("assets/car.json"),
      ),
    );
  }
}
