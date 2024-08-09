import 'package:flutter/material.dart';
import 'package:my_cv/models/experience.dart';
import 'package:my_cv/views/widgets/timeline_item.dart';

class ExperienceScreen extends StatelessWidget {
  final List<Experience> experiences = [
    Experience(
      yearRange: "2022 - (CURRENT)",
      title: "GRAPHIC DESIGN",
      company: "La Voz de Galicia",
      description: "Online & offline advertising design",
    ),
    Experience(
      yearRange: "2021 - 2022",
      title: "LAYOUT & GRAPHIC DESIGN",
      company: "Nós Diario / Sermos Galiza",
      description: "Offline design & layout infographics",
    ),
    Experience(
      yearRange: "2021",
      title: "GRAPHIC, LAYOUT, WEB AND SOCIAL MEDIA DESIGN",
      company: "Octo Comunicación",
      description: "Ads design, layout design, social media design",
    ),
  ];

  ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final experience = experiences[index];
        return TimelineItem(
            experience: experience,
            isFirst: index == 0,
            isLast: index == experiences.length - 1);
      },
    );
  }
}
