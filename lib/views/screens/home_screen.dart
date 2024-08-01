import 'package:flutter/material.dart';
import 'package:my_cv/views/screens/academic_views.dart';
import 'package:my_cv/views/screens/experience_views.dart';
import 'package:my_cv/views/screens/home_views.dart';
import 'package:my_cv/views/screens/languages_views.dart';
import 'package:my_cv/views/screens/skills_views.dart';
import 'package:my_cv/views/screens/summary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    const SummaryScreen(),
    const AcademicBgScreen(),
    ExperienceScreen(),
    const SkillsScreen(),
    const LanguagesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem('HOME', 0),
                    _buildDrawerItem('SUMMARY', 1),
                    _buildDrawerItem('ACADEMIC BACKGROUND', 2),
                    _buildDrawerItem('RELEVANT EXPERIENCE', 3),
                    _buildDrawerItem('TECH SKILLS', 4),
                    _buildDrawerItem('LANGUAGES', 5),
                    _buildDrawerItem('PORTFOLIO', null, bold: true),
                    _buildDrawerItem('DOWNLOAD CV', null, bold: true),
                    _buildDrawerItem('CONTACT', null),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff000072),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nat),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Academic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Experience',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Languages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildDrawerItem(String title, int? index, {bool bold = false}) {
    return Container(
      color: Colors.blue,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: index != null ? () => _onItemTapped(index) : null,
      ),
    );
  }
}
