import 'package:chnage_language_with_button/localization/classes/language_constants.dart';
import 'package:chnage_language_with_button/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'localization_event.dart';
import 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial('')) {
    on<LocalizationChange>((event, emit) async {
      debugPrint('.................Bloc');
      debugPrint(event.tabIndex);
      Locale _locale = await setLocale(event.tabIndex);
      MyApp.setLocale(event.con, _locale);
      emit(LocalizationInitial(event.tabIndex));
    });
  }
}
