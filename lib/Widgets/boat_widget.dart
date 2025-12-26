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


    _floatController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.03),
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
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.easeOutBack, // Gives that "settling in water" bounce
            tween: Tween<Offset>(
              begin: const Offset(-400, 40),
              end: const Offset(0, 0),
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
                'assets/boat.png',
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Positioned(
            bottom: 15,
            child: Container(
              width: 180,
              height: 5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlueAccent.withOpacity(0.3),
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