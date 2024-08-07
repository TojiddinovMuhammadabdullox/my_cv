import 'package:flutter/material.dart';

Widget buildLanguageItem({
  required String flagUrl,
  required String language,
  required String proficiency,
  required Color color,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.network(
            flagUrl,
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, color: color),
          ),
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
      ),
    ),
  );
}
