import 'package:chnage_language_with_button/localization/bloc/localization_bloc.dart';
import 'package:chnage_language_with_button/localization/bloc/localization_event.dart';
import 'package:chnage_language_with_button/localization/bloc/localization_state.dart';
import 'package:chnage_language_with_button/localization/classes/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(translation(context).settings),
        ),
        body: BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: language.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<LocalizationBloc>(context).add(
                      LocalizationChange(tabIndex: code[index], con: context),
                    );
                  },
                  child: Text(language![index] ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                );
              });
        }),
      ),
    );
  }

  List<String> language = ['English', 'Bengali', 'Arabic', 'فارسی', 'Japanese'];
  List<String> code = [
    'en',
    'bn',
    'ar',
    'fa',
    'ja',
  ];
}
