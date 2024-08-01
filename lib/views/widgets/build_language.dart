
  import 'package:flutter/material.dart';

Widget buildLanguageItem({
    required IconData flag,
    required String language,
    required String proficiency,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(flag, size: 24, color: color),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              language,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              proficiency,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }