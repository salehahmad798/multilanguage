import 'package:get/get.dart';
import 'package:getx_multilanguage/screens/language_screen.dart';
import 'package:getx_multilanguage/screens/slpash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';

  static String getSplashRoute() => splash;
  static String getInitialRoute() => initial;
  static String getLanguageRoute() => language;

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(), 
    ),
    GetPage(
      name: language,
      page: () => LanguageScreen(),
    ),
  ];
}
