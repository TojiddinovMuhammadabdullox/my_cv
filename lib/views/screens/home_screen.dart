import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:my_cv/views/screens/academic_views.dart';
import 'package:my_cv/views/screens/experience_views.dart';
import 'package:my_cv/views/screens/home_views.dart';
import 'package:my_cv/views/screens/languages_views.dart';
import 'package:my_cv/views/screens/skills_views.dart';
import 'package:my_cv/views/screens/summary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isLoading = false;

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
    return true; // Permission granted for iOS or already granted for Android
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
          SnackBar(
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
    final url =
        'https://pub-7be1d45c4a744f86846c80e90df909eb.r2.dev/files/d2744b1d-45b5-4958-924f-6dd49b150e7f.pdf';
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
            icon: _isLoading
                ? CircularProgressIndicator(color: Colors.black)
                : const Icon(Icons.picture_as_pdf, color: Colors.black),
            onPressed: _isLoading ? null : _downloadFile,
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
        onTap: onTap ?? (index != null ? () => _onItemTapped(index) : null),
      ),
    );
  }
}
