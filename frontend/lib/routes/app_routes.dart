import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/authentication/login_screen.dart';
import '../screens/authentication/register_screen.dart';
import '../screens/welcome/welcome_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/manual/manual_mode_screen.dart';
import '../screens/realtime/realtime_scren.dart';
import '../screens/history/history_screen.dart';
import '../screens/about/about_screen.dart';
import '../screens/about/awareness_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/consent/consent_screen.dart'; 

class AppRoutes {
  // 🔹 Route Names
  static const String splash = '/';
  static const String auth = '/auth';
  static const String login = '/login';
  static const String register = '/register';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String manualMode = '/manual-mode';
  static const String realtime = '/realtime';
  static const String history = '/history';
  static const String about = '/about';
  static const String awareness = '/awareness';
  static const String settings = '/settings';
  static const String consent = '/consent';

  // 🔹 Map of routes (optional)
  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    consent: (_) => const ConsentScreen(),
    auth: (_) => const LoginScreen(),
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    welcome: (_) => const WelcomeScreen(),
    home: (_) => const HomeScreen(),
    manualMode: (_) => const ManualModeScreen(),
    realtime: (_) => const RealtimeScreen(),
    history: (_) => const HistoryScreen(),
    about: (_) => const AboutScreen(),
    awareness: (_) => const AwarenessScreen(),
    settings: (_) => const SettingsScreen(),
  };

  // 🔹 Route generator for onGenerateRoute
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? splash; // fallback if null

    if (routes.containsKey(routeName)) {
      return MaterialPageRoute(builder: routes[routeName]!);
    }

    // Default fallback if route not found
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for $routeName'),
        ),
      ),
    );
  }
}
