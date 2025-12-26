import 'package:flutter/material.dart';
import 'package:lingo_assignement/Widgets/onboarding_content.dart';
import 'package:lingo_assignement/view/startJourney_screen.dart';
import 'package:provider/provider.dart';
import '../Widgets/next_widget.dart';
import '../view_models/onboarding_view_model.dart';
import '../widgets/custom_clipper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnboardingViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            color: vm.currentBackColor, // Directly uses the deep colors from VM
            width: double.infinity,
            height: double.infinity,
          ),
          // LAYER 1: The PageView
          PageView.builder(
            controller: vm.pageController,
            onPageChanged: vm.onPageChanged,
            itemCount: vm.pages.length + 1,
            itemBuilder: (context, index) {
              if (index < vm.pages.length) {
                return OnboardingContent(data: vm.pages[index]);
              }
              else {
                return StartJourney();
              }
            },
          ),

          // LAYER 2: The Clipper
          if(vm.currentIndex < 3)
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: 200,
                width: double.infinity,
                // We wrap the color in the container, and use the ClipPath on it
                child: ClipPath(
                  clipper: BottomCurveClipper(),
                  child: Container(
                    color: const Color(0xFF2E7D32), // Hardcoded dark green like video
                  ),
                ),
              ),
            ),

          // LAYER 3: The Arrow Button
          if(vm.currentIndex < 3)
          Positioned(
            bottom: 140,
            left: (screenWidth / 2) - 38,
            child: ArrowButton(
              onTap: () => vm.nextPage(context),
              iconColor: Colors.white,
              // The arrow icon color animates based on the page
              buttonBgColor: vm.currentColor,
            ),
          ),
        ],
      ),
    );
  }
}