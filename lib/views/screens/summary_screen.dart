import 'package:flutter/material.dart';
import 'package:my_cv/views/widgets/summart_widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSummaryItem(
              icon: Icons.storage,
              title: 'Polivalent',
              description:
                  'Plenty of skills around communication, media, web and advertising.',
            ),
            const SizedBox(height: 20),
            buildSummaryItem(
              icon: Icons.business_center,
              title: 'Experience',
              description:
                  'More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.',
            ),
            const SizedBox(height: 20),
            buildSummaryItem(
              icon: Icons.chat_bubble_outline,
              title: 'Open-minded',
              description:
                  'Always looking for the continuous improvement and ready to learn about the newest.',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
