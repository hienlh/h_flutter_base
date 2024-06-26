import 'package:flutter/material.dart';
import 'package:flutter_base/env.dart';
import 'package:lottie/lottie.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_AQcLsD.json',
              ),
              const SizedBox(height: 20),
              Text(
                Env().maintainingData['title'] ?? 'Under maintenance',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                Env().maintainingData['description'] ??
                    'We are currently performing some maintenance. Please check back later.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
