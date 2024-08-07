import 'package:flutter/material.dart';
import 'package:my_cv/models/experience.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.yearRange,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 8.0),
            Text(
              experience.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              experience.company,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8.0),
            Text(experience.description),
          ],
        ),
      ),
    );
  }
}
