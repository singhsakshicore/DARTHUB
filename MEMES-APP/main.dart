import 'package:flutter/material.dart';
import 'package:first_app/screens/meme_homepage.dart';

void main() {
  runApp(MemeApp());
}

class MemeApp extends StatelessWidget {
  const MemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MemeHomePage(),
    );
  }
}
