import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/theme_helpers.dart';

void main() {
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
      getPages: AppRoutes().getRoutes(),
    );
  }
}