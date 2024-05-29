// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application/src/components/bottomNavbar.dart';


class HomePage extends StatelessWidget {
  static const String routename = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}
