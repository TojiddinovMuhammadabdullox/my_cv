import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  void _navigate() async {
    const url =
        "https://yandex.uz/maps/geo/1508547282/?ll=72.048075%2C40.708170&z=14.23";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't find url";
    }
  }

  void _openTG() async {
    const url = "https://t.me/tojiddinov7";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't find url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZoomTapAnimation(
            onTap: _openTG,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade500,
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tojiddinov\nMuhammad Abdulloh',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            ' Passionate Flutter Developer\n'
            ' Enthusiastic Open Source Contributor\n',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '+1 years experience',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, color: Colors.blue[900]),
              const SizedBox(width: 4),
              TextButton(
                onPressed: _navigate,
                child: const Text(
                  "Uzbekistan, Andijan, Shahrixan",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000072),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          ZoomTapAnimation(
            onTap: () async {
              const phoneNumber = 'tel: +998991075508';
              if (await canLaunch(phoneNumber)) {
                await launch(phoneNumber);
              } else {
                throw "Telfon qibomadi";
              }
            },
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff000072),
              ),
              child: const Center(
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
