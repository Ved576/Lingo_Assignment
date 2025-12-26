// lib/views/language_screen.dart
import 'package:flutter/material.dart';
import 'package:lingo_assignement/Widgets/boat_widget.dart';
import 'package:provider/provider.dart';
import '../Widgets/laguage_grid.dart';
import '../view_models/language_view_model.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We wrap the screen in a ChangeNotifierProvider just for this view
    return ChangeNotifierProvider(
      create: (_) => LanguageViewModel(),
      child: Consumer<LanguageViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: const Color(0xFF05101A),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 300,
                      left: 200,
                      child: Image.asset("assets/box.png", height: 200,width: 200,)),
                Column(
                  children: [
                    const SizedBox(height: 60),
                    LanguageGrid(
                      selectedLanguage: vm.selectedLanguage,
                      onSelect: (name) => vm.selectLanguage(name),
                    ),

                    SizedBox(height: 180),

                    // The Animated Boat we built earlier
                    AnimatedBoat(),

                    const Text(
                      "CHOOSE LANGUAGE",
                      style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 4),
                    ),

                    const SizedBox(height: 30),

                    // USE YOUR NEW WIDGET HERE

                    const SizedBox(height: 20),

                    // CONTINUE BUTTON (Only active if a language is picked)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: vm.isReady ? Colors.blue.shade600 : Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                          ),
                          onPressed: vm.isReady ? () {
                            // Final Navigation to Dashboard/Home
                          } : null,
                          child: const Text("CONTINUE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
              ),
            ),
          );
        },
      ),
    );
  }
}