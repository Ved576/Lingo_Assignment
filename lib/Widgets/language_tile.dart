import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageTile({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? Colors.tealAccent.withOpacity(0.2)
          : Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.blue.shade300 : Colors.white10,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: isSelected ? Colors.blue.shade300 : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}