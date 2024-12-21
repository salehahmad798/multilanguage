import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_multilanguage/controllers/language_controller.dart';
import 'package:getx_multilanguage/models/language_model.dart';
import 'package:getx_multilanguage/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String,Map<String,String>>> init() async {
  final  sharedPreferences= await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
Get.lazyPut(()=>LocalizationControler(sharedPreferences: Get.find()));

Map<String, Map<String, String>> _languages= Map();
for(LanguageModel languageModel in AppConstants.languages)
{
  String jsonStringValues= await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');

Map<String ,dynamic> _mappedJson=json.decode(jsonStringValues);
Map<String,String> _json=Map();
_mappedJson.forEach((key,values)
{
  _json[key]=values.toString();

});
_languages['${languageModel.languageCode}_${languageModel.countryCode}']=_json;
  
  }
  return _languages;
}