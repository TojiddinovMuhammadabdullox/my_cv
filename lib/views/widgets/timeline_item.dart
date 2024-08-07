import 'package:flutter/material.dart';
import 'package:my_cv/models/experience.dart';
import 'package:my_cv/views/widgets/experience_card.dart';

class TimelineItem extends StatelessWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.experience,
    this.isFirst = false,
    this.isLast = false,
  });

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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade300, Colors.purple.shade300],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.purple],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.brightness_1,
                  color: Colors.white, size: 16.0),
            ),
            if (!isLast)
              Container(
                height: 20.0,
                width: 2.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade300, Colors.purple.shade300],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
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
