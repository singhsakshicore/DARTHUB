import 'package:flutter/material.dart';
import 'package:first_app/language_translation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Translator',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslationPage(),
    );
  }
}
