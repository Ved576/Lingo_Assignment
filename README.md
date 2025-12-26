A high-fidelity Flutter application featuring a seamless transition from a 
character-driven introduction to an interactive, animated language selection process. 
This project demonstrates advanced UI/UX techniques, MVVM Architecture, and custom animation logic.

+ Key Features
1. Dynamic Onboarding (Screens 1–3)
Synchronized Transitions: Uses a PageView layered with an AnimatedContainer to transition 
background colors and character assets smoothly.

Custom Geometric UI: Implements a signature "Wave" aesthetic using a CustomClipper and ClipPath.

Smart State Management: ViewModels track indices to update UI elements (like the navigation arrow) 
dynamically.

2. Cinematic Transition (Screen 4)
Stack-Clearing Navigation: Uses pushReplacement to finalize the onboarding stage, preventing 
users from swiping back once the journey begins.

Custom Route Transitions: Implements a Fade-Up PageRoute for a professional, "app-launch" feel.

3. Animated Language Selection (Screen 5)
Compound Boat Animation: * Arrival: The boat sails in from the left using a TweenAnimationBuilder
with an easeOutBack curve.

Idle: A continuous, infinite "bobbing" effect using a repeating AnimationController.

Interactive 2X3 Grid: A custom-built language selection grid with glassmorphism styling and 
real-time selection highlighting.

+ Tech Stack & Architecture
  Framework: Flutter

Architecture: MVVM (Model-View-ViewModel)

Models: Data structures for onboarding content and language items.

Views: Decoupled UI layers (Home, StartJourney, LanguageScreen).

ViewModels: Business logic and state management using ChangeNotifier.

State Management: Provider for reactive UI updates.

Bash

flutter pub get
Assets Setup: Ensure your pubspec.yaml includes the character images and the boat asset:

YAML

assets:
- assets/pirate.png
- assets/boat.png
- assets/box.png
- assets/frog.png
- assets/monk1.png


Run the App:

Bash

flutter run

+ Technical Highlights
RangeError Prevention: Implemented "Safe Getters" in the ViewModel to handle index-based asset 
fetching beyond the length of the data list.

Nested Animations: Combined implicit (TweenAnimationBuilder) and explicit (AnimationController) 
animations within a single widget to create complex movement patterns.

Responsive Scaling: Used MediaQuery to ensure character assets scale proportionally across 
different device sizes.
