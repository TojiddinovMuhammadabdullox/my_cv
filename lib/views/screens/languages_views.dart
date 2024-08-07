import 'package:flutter/material.dart';
import 'package:my_cv/views/widgets/build_language.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Languages",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flagUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Uzbekistan.svg/1280px-Flag_of_Uzbekistan.svg.png",
              language: 'Uzbek',
              proficiency: 'native speaker',
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flagUrl:
                  "https://www.advantour.com/russia/images/symbolics/russia-flag.jpg",
              language: 'Russia',
              proficiency: 'Basic',
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            buildLanguageItem(
              flagUrl:
                  "https://t3.ftcdn.net/jpg/01/97/07/92/360_F_197079266_9VNYd3mK4kS7EvFlLOf6CDDbcYmEALE9.jpg",
              language: 'English',
              proficiency: 'Basic',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
