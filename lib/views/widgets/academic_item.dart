import 'package:flutter/material.dart';

Widget buildAcademicItem({
  required String category,
  required String title,
  required String institution,
  required String year,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.bookmark, size: 20, color: Colors.pink.shade300),
          const SizedBox(width: 10),
          Text(
            category,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade300,
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        institution,
        style: const TextStyle(
            fontSize: 16, color: Color.fromARGB(255, 41, 1, 151)),
      ),
      const SizedBox(height: 5),
      Text(
        'Year: $year',
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    ],
  );
}
