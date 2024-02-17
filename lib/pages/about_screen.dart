import 'package:chnage_language_with_button/localization/classes/language_constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).aboutUs),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(translation(context).about),
        ),
      ),
    );
  }
}
