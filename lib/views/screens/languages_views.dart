import 'package:flutter/material.dart';
import 'package:my_cv/views/widgets/build_language.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Languages",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildLanguageItem(
              flag: Icons.language,
              language: 'Uzbek',
              proficiency: 'native speaker',
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flag: Icons.language,
              language: 'Spanish',
              proficiency: 'Basic',
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flag: Icons.language,
              language: 'English',
              proficiency: 'Basic',
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flag: Icons.language,
              language: 'Japanese',
              proficiency: 'Basic',
              color: Colors.orange,
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flag: Icons.language,
              language: 'French',
              proficiency: 'Basic',
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
