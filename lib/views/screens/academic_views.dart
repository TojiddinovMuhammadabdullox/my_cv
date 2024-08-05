import 'package:flutter/material.dart';
import 'package:my_cv/views/widgets/academic_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AcademicBgScreen extends StatelessWidget {
  const AcademicBgScreen({super.key});
  void _navigate() async {
    const url =
        "https://github.com/TojiddinovMuhammadabdullox?tab=repositories";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't find url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: buildAcademicItem(
                category: 'GRADUATE',
                title: 'SCHOOL 44',
                institution: 'IN MY HOME TOWN',
                year: '2024',
              ),
            ),
            const SizedBox(height: 35),
            buildAcademicItem(
              category: 'MASTER',
              title: 'GALICIAN LANG.',
              institution: 'Universidade da Coruña',
              year: '2009',
            ),
            const SizedBox(height: 35),
            buildAcademicItem(
              category: 'SUPERIOR TECHNICIAN',
              title: 'WEB APP DEVELOPMENT',
              institution: 'IES Fernando Wirtz (A Coruña)',
              year: '2016',
            ),
            const SizedBox(height: 35),
            ZoomTapAnimation(
              onTap: _navigate,
              child: Container(
                child: buildAcademicItem(
                  category: 'SPECIALIZATION',
                  title: 'FLUTTER DEVELOPER',
                  institution: 'ENTER GITHUB',
                  year: '2022',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
