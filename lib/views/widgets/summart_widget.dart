import 'package:flutter/material.dart';

Widget buildSummaryItem({
  required IconData icon,
  required String title,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(icon, size: 40, color: Colors.blue),
      const SizedBox(width: 10),
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
