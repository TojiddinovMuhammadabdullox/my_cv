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
    Experience(
      yearRange: "2020 - 2020",
      title: "FRONT END DEV. UI DESIGN",
      company: "Sofftek",
      description: "Web Design & developing with Angular",
    ),
    Experience(
      yearRange: "2016 - 2020",
      title: "GRAPHIC DESIGN",
      company: "La Voz de Galicia",
      description: "Online & offline advertising design",
    ),
    Experience(
      yearRange: "2015",
      title: "CONTENT MANAGER",
      company: "Vector ITC",
      description: "Manage language version for job web portal",
    ),
    Experience(
      yearRange: "2012",
      title: "GRAPHIC DESIGN",
      company: "Freelance",
      description: "Logo design, advertising, layout",
    ),
  ];

  ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
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
