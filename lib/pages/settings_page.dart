import 'package:flutter/material.dart';

import '../classes/language.dart';
import '../classes/language_constants.dart';
import '../main.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future onPressed() async {
      Locale _locale = await setLocale("en");
      MyApp.setLocale(context, _locale);
  }
  Future onPressed1() async {
    Locale _locale = await setLocale("bn");
    MyApp.setLocale(context, _locale);
  }
  Future onPressed2() async {
    Locale _locale = await setLocale("ar");
    MyApp.setLocale(context, _locale);
  }
  Future onPressed3() async {
    Locale _locale = await setLocale("fa");
    MyApp.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).settings),
      ),
      body: Column(
        children: [
          Center(
              child: DropdownButton<Language>(
            iconSize: 30,
            hint: Text(translation(context).changeLanguage),
            onChanged: (Language? language) async {
              if (language != null) {
                Locale _locale = await setLocale(language.languageCode);
                MyApp.setLocale(context, _locale);
              }
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                .toList(),
          )),
          SizedBox(height: 100,),
          TextButton(
            onPressed: onPressed,
            child:  Text("English"),
          ),
          TextButton(
            onPressed: onPressed1,
            child: const Text("Bengali"),
          ),
          TextButton(
            onPressed: onPressed2,
            child: const Text("Arabic"),
          ),
          TextButton(
            onPressed: onPressed3,
            child: const Text("فارسی"),
          ),

        ],
      ),
    );
  }
}
