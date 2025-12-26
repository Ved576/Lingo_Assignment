import 'package:flutter/material.dart';

class AnimatedBoat extends StatefulWidget {
  const AnimatedBoat({super.key});

  @override
  State<AnimatedBoat> createState() => _AnimatedBoatState();
}

class _AnimatedBoatState extends State<AnimatedBoat> with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<Offset> _floatAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Setup the Infinite Floating (Bobbing) Animation
    _floatController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.03), // Subtle 3% vertical movement
    ).animate(CurvedAnimation(
      parent: _floatController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // THE ARRIVAL ANIMATION (Sails in from right/bottom)
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.easeOutBack, // Gives that "settling in water" bounce
            tween: Tween<Offset>(
              begin: const Offset(-400, 40), // Starts off-screen
              end: const Offset(0, 0),      // Arrives at center
            ),
            builder: (context, Offset arrivalOffset, child) {
              return Transform.translate(
                offset: arrivalOffset,
                child: child,
              );
            },
            child: SlideTransition(
              position: _floatAnimation, // Adds the bobbing effect
              child: Image.asset(
                'assets/boat.png', // Ensure this matches your pubspec.yaml
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // OPTIONAL: Water Shadow/Reflection
          Positioned(
            bottom: 40,
            child: Container(
              width: 150,
              height: 20,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}