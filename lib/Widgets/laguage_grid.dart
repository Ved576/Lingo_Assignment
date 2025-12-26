import 'package:flutter/material.dart';
import 'language_tile.dart';

class LanguageGrid extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) onSelect;

  const LanguageGrid({
    super.key,
    required this.selectedLanguage,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> languages = [
      {"name": "ENGLISH"},
      {"name": "हिन्दी"},
      {"name": "ESPAÑOL"},
      {"name": "मराठी"},
      {"name": "বাংলা"},
      {"name": "தமிழ்"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: languages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final lang = languages[index];
        return LanguageTile(
          name: lang['name']!,
          isSelected: selectedLanguage == lang['name'],
          onTap: () => onSelect(lang['name']!),
        );
      },
    );
  }
}