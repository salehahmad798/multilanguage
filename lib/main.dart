import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_multilanguage/controllers/language_controller.dart';
import 'package:getx_multilanguage/screens/slpash_screen.dart';
import 'package:getx_multilanguage/utils/app_constants.dart';
import 'package:getx_multilanguage/utils/app_router.dart';
import 'package:getx_multilanguage/utils/messege.dart';
import 'utils/dep.dart' as dep;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String,String>> _language=await dep.init();
  runApp( MyApp(languages: _language,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.languages});
  final Map<String,Map<String,String>> languages;

  @override
  Widget build(BuildContext context) { 
  

    return GetBuilder<LocalizationControler>(builder: (LocalizationControler) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: LocalizationControler.locale,
          translations: Messages( languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.getSplashRoute(),
          getPages: RouteHelper.routes,
          home: const SplashScreen());
    });
  }
}
