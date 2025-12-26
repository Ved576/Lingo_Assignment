import 'package:flutter/material.dart';
import 'package:lingo_assignement/view/onBoardScreen.dart';
import 'package:provider/provider.dart'; // 1. Import Provider
import 'package:lingo_assignement/view_models/onboarding_view_model.dart';

void main() {
  runApp(
    // 2. Wrap the app with ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}