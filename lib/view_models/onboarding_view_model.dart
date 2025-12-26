import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../view/startJourney_screen.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  final PageController pageController = PageController();

  final List<onBoardingModel> pages = [
    onBoardingModel(
      title: "AHOY! \n Welcome aboard!",
      Description: "Learn Language as you\n sail through islands\n of adventure!",
      imgPath: "assets/frog.png",
      characterName: 'HOPPIE',
      themeColor: Colors.green,
      backColor: Color(0xFF0D1B2A),
    ),

    onBoardingModel(
        title: "FOCUS! \n YOUR MIND!",
        Description: "Master words, unlock \n treasures and level up\nyour journey",
        imgPath: "assets/monk1.png",
        characterName: 'MOKSH',
        themeColor: Colors.orangeAccent.shade400,
        backColor: Color(0xFF354C63)
    ),

    onBoardingModel(
      title: "PREPARE! \n For the Quest!",
      Description: "Face tougher challenges, \n earn rewards & rise as\n a true warrior",
      imgPath: "assets/pirate.png",
      characterName: 'PIRATE',
      themeColor: Colors.brown,
      backColor: Color(0xFF0D1B2A),

    ),
  ];

  Color get currentColor {
    if (_currentIndex < pages.length) {
      return pages[_currentIndex].themeColor;
    }
    return Colors.tealAccent; // Default color for custom screens
  }

  Color get currentBackColor {
    if (_currentIndex < pages.length) {
      return pages[_currentIndex].backColor;
    }
    return const Color(0xFF05101A);
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (_currentIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutQuart,
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation,
              secondaryAnimation) => const StartJourney(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var positionTween = Tween<Offset>(
              begin: const Offset(0.0, 0.1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            ));

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: positionTween,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 1500),
        ),
      );
    }
  }
}