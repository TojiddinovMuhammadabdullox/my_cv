import 'package:flutter/material.dart';
import 'package:my_cv/views/widgets/skills_item.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
              iconPath: 'assets/icons/photoshop.png',
              skillName: 'Adobe Photoshop',
            ),
            SkillItem(
              iconPath: 'assets/icons/illustrator.png',
              skillName: 'Adobe Illustrator',
            ),
            SkillItem(
              iconPath: 'assets/icons/java.png',
              skillName: 'Java Mobile Android',
            ),
            SkillItem(
              iconPath: 'assets/icons/aftereffects.png',
              skillName: 'Adobe After Effects',
            ),
            SkillItem(
              iconPath: 'assets/icons/figma.png',
              skillName: 'Figma',
            ),
            SkillItem(
              iconPath: 'assets/icons/html15.png',
              skillName: 'HTML5',
            ),
            SkillItem(
              iconPath: 'assets/icons/css3.png',
              skillName: 'CSS3',
            ),
            SkillItem(
              iconPath: 'assets/icons/kotlin.png',
              skillName: 'Kotlin',
            ),
            SkillItem(
              iconPath: 'assets/icons/vscode.png',
              skillName: 'VS Code',
            ),
          ],
        ),
      ),
    );
  }
}
