import 'package:flutter/material.dart';
import 'package:reminderapp/screens/home_screen.dart';

void main() {
  runApp(const RemindersApp());
}

class RemindersApp extends StatelessWidget {
  const RemindersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
