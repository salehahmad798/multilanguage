import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_multilanguage/models/language_model.dart';
import 'package:getx_multilanguage/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationControler extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  LocalizationControler({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  Locale _locale = Locale(AppConstants.languages[0].languageCode,
      AppConstants.languages[0].countryCode);
  Locale get locale => _locale;
  var _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;
  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.languages[0].languageCode,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages[0].countryCode);

for (int index = 0; index < AppConstants.languages.length; index++) {
  if(AppConstants.languages[index].languageCode==_locale.languageCode){
    _selectedIndex=index;
    break;
  }
}
_languages=[];
  _languages.addAll(AppConstants.languages);
  update();
  }


// void setlanguage(Locale locale){
//   Get.updateLocale(locale);
//   _locale=locale;
//   update();
// }
void setLanguage(Locale locale) async {
  Get.updateLocale(locale);
  _locale = locale;
  sharedPreferences.setString(AppConstants.LANGUAGE_CODE, locale.languageCode);
  sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  update();
}

void setSelectIndex(int index){
  _selectedIndex=index;
  update();
}
void saveLanguage(Locale locale)async{
  sharedPreferences.setString(AppConstants.LANGUAGE_CODE,locale.languageCode);
  sharedPreferences.setString(AppConstants.COUNTRY_CODE,locale.countryCode!);
}
}
