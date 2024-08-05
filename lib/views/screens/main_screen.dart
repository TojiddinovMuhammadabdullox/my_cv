import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_cv/views/screens/academic_views.dart';
import 'package:my_cv/views/screens/experience_views.dart';
import 'package:my_cv/views/screens/home_views.dart';
import 'package:my_cv/views/screens/languages_views.dart';
import 'package:my_cv/views/screens/skills_views.dart';
import 'package:my_cv/views/screens/summary_screen.dart';
import 'package:my_cv/views/widgets/nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _isLoading = false;

  final List<Widget> _screens = [
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

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await _isAndroid11OrHigher()) {
        // For Android 11 (API 30) and above
        if (!await Permission.manageExternalStorage.isGranted) {
          final status = await Permission.manageExternalStorage.request();
          return status.isGranted;
        }
      } else {
        // For Android 10 and below
        if (!await Permission.storage.isGranted) {
          final status = await Permission.storage.request();
          return status.isGranted;
        }
      }
    }
    return true;
  }

  Future<bool> _isAndroid11OrHigher() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return androidInfo.version.sdkInt >= 30;
    }
    return false;
  }

  Future<void> _downloadFile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final hasPermission = await _requestStoragePermission();
      if (hasPermission) {
        await _proceedWithDownload();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Storage permission denied. Unable to download.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _proceedWithDownload() async {
    const url = 'https://www.freesumes.com/generatePDF.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Directory? directory;
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory != null) {
        final file = File('${directory.path}/cv.pdf');
        await file.writeAsBytes(response.bodyBytes);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Download completed: ${file.path}')),
        );
      } else {
        throw Exception('Unable to access storage directory');
      }
    } else {
      throw Exception('Failed to download file: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: _isLoading
                ? const CircularProgressIndicator(color: Colors.black)
                : const Icon(Icons.picture_as_pdf, color: Colors.black),
            onPressed: _isLoading ? null : _downloadFile,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(),
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
                    _buildDrawerItem('DOWNLOAD CV', null,
                        bold: true, onTap: _downloadFile),
                    _buildDrawerItem('CONTACT', null),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: ModernBottomNavBar(
        onItemSelected: (value) {
          _onItemTapped(value);
        },
        items: [
          BottomNavItem(
            icon: Icons.home,
            label: "Home",
            color: Colors.purple, // Random color
          ),
          BottomNavItem(
            icon: Icons.link,
            label: "Summary",
            color: Colors.orange, // Random color
          ),
          BottomNavItem(
            icon: Icons.grading_rounded,
            label: "Academic",
            color: Colors.teal, // Random color
          ),
          BottomNavItem(
            icon: Icons.history_edu_sharp,
            label: "Experience",
            color: Colors.pink, // Random color
          ),
          BottomNavItem(
            icon: Icons.soup_kitchen_rounded,
            label: "Skills",
            color: const Color.fromARGB(255, 9, 144, 153), // Random color
          ),
          BottomNavItem(
            icon: Icons.language,
            label: "Languages",
            color: Colors.cyan, // Random color
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, int? index,
      {bool bold = false, VoidCallback? onTap}) {
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
        onTap: onTap ?? (index != null ? () => _onItemTap(index) : null),
      ),
    );
  }
}
