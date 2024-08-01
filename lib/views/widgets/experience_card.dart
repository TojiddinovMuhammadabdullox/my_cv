import 'package:flutter/material.dart';
import 'package:my_cv/models/experience.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  ExperienceCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.yearRange,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 8.0),
            Text(
              experience.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              experience.company,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 8.0),
            Text(experience.description),
          ],
        ),
      ),
    );
  }
}
