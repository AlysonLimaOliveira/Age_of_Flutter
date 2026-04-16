import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_menu.dart';

void main() {
  runApp(const AgeOfFlutterApp());
}

class AgeOfFlutterApp extends StatelessWidget {
  const AgeOfFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age of Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.medievalSharpTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const MainMenu(),
    );
  }
}