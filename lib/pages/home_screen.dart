import 'package:chnage_language_with_button/localization/bloc/localization_bloc.dart';
import 'package:chnage_language_with_button/localization/bloc/localization_event.dart';
import 'package:chnage_language_with_button/localization/bloc/localization_state.dart';
import 'package:chnage_language_with_button/localization/model/language.dart';
import 'package:chnage_language_with_button/localization/classes/language_constants.dart';
import 'package:chnage_language_with_button/pages/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';
import '../router/route_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? selectedTime;
  // void _showSuccessDialog() {
  //   showTimePicker(context: context, initialTime: TimeOfDay.now());
  // }

  Future<void> _showTimePicketDialog() async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {
        selectedTime = time.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(translation(context).homePage),
          actions: <Widget>[
            BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      debugPrint(language?.languageCode);
                      debugPrint('.....UI');
                      BlocProvider.of<LocalizationBloc>(context).add(
                        LocalizationChange(
                            tabIndex: language.languageCode, con: context),
                      );
                      // Locale _locale = await setLocale(language.languageCode);
                      // Test().onButtonTapped(_locale);
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
                ),
              );
            }),
          ],
        ),
        drawer: Drawer(
          child: _drawerList(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: _mainForm(context),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                translation(context).personalInformation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            controller: nameCon,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).name,
              hintText: translation(context).nameHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            controller: emailCon,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).email,
              hintText: translation(context).emailHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: translation(context).dateOfBirth,
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              _selectDate(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: selectedTime ?? translation(context).time,
            ),
            onTap: () async {
              _showTimePicketDialog();
            },
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              if (_key.currentState != null && _key.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              name: nameCon.text,
                              email: emailCon.text,
                              date: selectedDate.toString().split(' ')[0],
                              time: selectedTime,
                            )));
              }
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                translation(context).submitInfo,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: const CircleAvatar(),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).aboutUs,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).settings,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
