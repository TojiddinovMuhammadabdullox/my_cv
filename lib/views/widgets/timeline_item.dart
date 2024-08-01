import 'package:flutter/material.dart';
import 'package:my_cv/models/experience.dart';
import 'package:my_cv/views/widgets/experience_card.dart';

class TimelineItem extends StatelessWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const TimelineItem(
      {super.key,
      required this.experience,
      this.isFirst = false,
      this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                height: 20.0,
                width: 2.0,
                color: Colors.pink,
              ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.circle, color: Colors.white, size: 16.0),
            ),
            if (!isLast)
              Container(
                height: 20.0,
                width: 2.0,
                color: Colors.pink,
              ),
          ],
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ExperienceCard(experience: experience),
        ),
      ],
    );
  }
}
