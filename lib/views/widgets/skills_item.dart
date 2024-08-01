
import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final String iconPath;
  final String skillName;

  const SkillItem({
    super.key,
    required this.iconPath,
    required this.skillName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 16),
          Text(
            skillName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
