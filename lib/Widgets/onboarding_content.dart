import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final onBoardingModel data;

  const OnboardingContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(seconds: 1),
    transitionBuilder: (Widget child, Animation<double> animation) {
    return FadeTransition(
    opacity: animation,
    child: child,
    );
    },

      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),

        Text(
          data.title ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 42,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            data.Description ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white60,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 10,),

        TweenAnimationBuilder(
          key: ValueKey(data.imgPath),
          tween: Tween<double>(begin: 0.05, end: 1.1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.elasticOut, // This creates the "bouncy" effect
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: child,
              ),
            );
          },
          child: Image.asset(
            data.imgPath ?? "",
            height: 250,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 10),

          Text(
            data.characterName ?? "",
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 20),
          ),

        const SizedBox(height: 40),

      ],
      ),
    );
  }
}