import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/contact_screen.dart'; // tambahkan import untuk ContactScreen
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UMSIDA Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/home': (context) => const ProfileScreen(),
        '/contact': (context) => const ContactScreen(),
      },
    );
  }
}
