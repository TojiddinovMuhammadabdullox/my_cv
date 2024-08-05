import 'package:flutter/material.dart';
import 'package:my_cv/views/widgets/skills_item.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Skills: Tech",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SkillItem(
              iconPath: 'assets/icons/java.png',
              skillName: 'Java',
            ),
            SkillItem(
              iconPath: 'assets/icons/kotlin.png',
              skillName: 'Kotlin',
            ),
            SkillItem(
              iconPath: 'assets/icons/vscode.png',
              skillName: 'VS Code',
            ),
            SkillItem(
              iconPath: 'assets/icons/flutter.png',
              skillName: 'Flutter',
            ),
            SkillItem(
              iconPath: 'assets/icons/android.png',
              skillName: 'Android Studio',
            ),
          ],
        ),
      ),
    );
  }
}
