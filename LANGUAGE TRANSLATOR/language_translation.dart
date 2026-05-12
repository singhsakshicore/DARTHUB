import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() =>
      _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ['English', 'Hindi', 'Marathi', 'Arabic'];

  String originLanguage = "English";
  String destinationLanguage = "Hindi";

  String output = "";

  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    final translator = GoogleTranslator();

    var translation = await translator.translate(input, from: src, to: dest);

    setState(() {
      output = translation.text;
    });
  }

  String getLanguageCode(String language) {
    switch (language) {
      case "English":
        return "en";
      case "Hindi":
        return "hi";
      case "Marathi":
        return "mr";
      case "Arabic":
        return "ar";
      default:
        return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 119, 234),

      appBar: AppBar(
        title: const Text("Language Translator"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 227, 234, 246),
        elevation: 0,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// FROM DROPDOWN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: originLanguage,
                    iconEnabledColor: Colors.white,
                    style: const TextStyle(color: Colors.black),

                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),

                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),

                  const Icon(Icons.arrow_forward, color: Colors.white),

                  /// TO DROPDOWN
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: destinationLanguage,
                    iconEnabledColor: Colors.white,
                    style: const TextStyle(color: Colors.black),

                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),

                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// TEXT FIELD
              Padding(
                padding: const EdgeInsets.all(8.0),

                child: TextFormField(
                  controller: languageController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),

                  decoration: const InputDecoration(
                    labelText: "Please enter your text",
                    labelStyle: TextStyle(color: Colors.white),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2b3c5a),
                ),

                onPressed: () {
                  translate(
                    getLanguageCode(originLanguage),
                    getLanguageCode(destinationLanguage),
                    languageController.text.toString(),
                  );
                },

                child: const Text("Translate"),
              ),

              const SizedBox(height: 30),

              /// OUTPUT
              Padding(
                padding: const EdgeInsets.all(8.0),

                child: Text(
                  output,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
