import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../manual/manual_mode_screen.dart';
import '../realtime/realtime_scren.dart';
import '../history/history_screen.dart';
import '../about/about_screen.dart';
import '../about/awareness_screen.dart';
import '../settings/settings_screen.dart';
import '../consent/consent_screen.dart';
import '../../widgets/animated_toggle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isManualMode = true;

  final List<Widget> _tabs = [
    const SizedBox(), // Placeholder for Home tab content
    const HistoryScreen(),
    const AwarenessScreen(),
    const SettingsScreen(),
    const AboutScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _checkConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasConsented') ?? false;
  }

  void _navigateMode(bool isManual) async {
    final hasConsented = await _checkConsent();
    if (!hasConsented && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ConsentScreen()),
      );
    } else {
      setState(() {
        _isManualMode = isManual;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_selectedIndex == 0) {
      // Home tab with toggle
      body = Column(
        children: [
          const SizedBox(height: 20),
          AnimatedToggle(
            values: const ["Manual Mode", "Real-Time Mode"],
            onToggleCallback: (index) {
              // Consent check before switching mode
              _navigateMode(index == 0);
            },
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isManualMode
                  ? const ManualModeScreen()
                  : const RealtimeScreen(),
            ),
          ),
        ],
      );
    } else {
      body = _tabs[_selectedIndex];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("DeepGuard AI"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: "Awareness"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
