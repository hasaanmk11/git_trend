import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashElements extends StatelessWidget {
  const SplashElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'GitTrend',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Discover Trending GitHub Repositories',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 30),
        Lottie.asset(
          'assets/animations/loading.json',
          width: 220,
          repeat: true,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
