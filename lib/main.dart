import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/habit_tracker_screen.dart';
import 'package:habit_tracker/service/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

bool? _isLoggedIn;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotifications();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  _isLoggedIn = prefs.getBool('isLoggedIn');

  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: _isLoggedIn ?? false
          ? const HabitTrackerScreen()
          : const LoginScreen(),
    );
  }
}
