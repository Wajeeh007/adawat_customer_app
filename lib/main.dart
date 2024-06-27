import 'package:adawat_customer_app/bindings/init_binding.dart';
import 'package:adawat_customer_app/helpers/app_languages.dart';
import 'package:adawat_customer_app/screens/bottom_appbar/bottom_appbar_view.dart';
import 'package:adawat_customer_app/screens/category_services_list/category_services_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'helpers/theme_helpers.dart';
import 'package:get_storage/get_storage.dart';

/// Things to do with Mac
//TODO: Configure google maps for iOS

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adawat Service App',
      theme: ThemeHelpers.lightTheme,
      darkTheme: ThemeHelpers.darkTheme,
      home: CategoryServicesListView(),
      themeMode: ThemeMode.system,
      textDirection: TextDirection.ltr,
      translations: AppLanguages(),
      defaultTransition: Transition.rightToLeftWithFade,
      locale: getLocale(initLanguageController.languageKey.value),
      fallbackLocale: const Locale('en', 'US'),
      // getPages: AppRoutes.pages,
    );
  }

  Locale getLocale(String languageKey) {
    return Locale(
      initLanguageController.optionsLocales[languageKey]['languageCode'],
      initLanguageController.optionsLocales[languageKey]['countryCode']
    );
  }
}