import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelpers {

  static final textTheme = Theme.of(Get.context!).textTheme;

  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    splashFactory: NoSplash.splashFactory,
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryWhite,
    textTheme: TextThemes.textTheme(color: primaryBlack),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryWhite),
    iconTheme: const IconThemeData(color: primaryBlack, size: 20,),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: primaryWhite,
        // titleTextStyle:
      ),
      inputDecorationTheme: InputDecorationTheme(
        // errorStyle: ,
          prefixIconColor: darkThemeLightGrey,
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: primaryBlack, width: 1.2)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: primaryBlack, width: 2)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: errorRed, width: 1.2),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: errorRed, width: 2),
            borderRadius: BorderRadius.circular(20),
          )
      ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryDullYellow,
    )
  );

  static ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true
  ).copyWith(
      textTheme: TextThemes.textTheme(color: darkThemeLightGrey),
    splashFactory: NoSplash.splashFactory,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryBlack,
    colorScheme: ColorScheme.fromSeed(seedColor: darkThemeLightGrey),
    iconTheme: const IconThemeData(color: darkThemeLightGrey, size: 20,),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryBlack,
      // titleTextStyle:
    ),
    inputDecorationTheme: InputDecorationTheme(
      // errorStyle: ,
      prefixIconColor: darkThemeLightGrey,
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: darkThemeLightGrey, width: 1.2)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: darkThemeLightGrey, width: 2)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: errorRed, width: 1.2),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: errorRed, width: 2),
        borderRadius: BorderRadius.circular(20),
      )
    ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: darkThemeLightGrey,
      )
  );
}

class TextThemes {

  static TextTheme textTheme({required Color color}) => TextTheme(
    titleLarge: TextStyle(
      fontSize: 34,
      color: color,
      fontWeight: FontWeight.bold
    ),
    titleMedium: TextStyle(
        fontSize: 32,
        color: color,
        fontWeight: FontWeight.bold
    ),
    titleSmall: TextStyle(
        fontSize: 30,
        color: color,
        fontWeight: FontWeight.bold
    ),
    bodyLarge: TextStyle(
        fontSize: 24,
        color: color,
        fontWeight: FontWeight.w600
    ),
    bodyMedium: TextStyle(
        fontSize: 22,
        color: color,
        fontWeight: FontWeight.w600
    ),
    bodySmall: TextStyle(
        fontSize: 20,
        color: color,
        fontWeight: FontWeight.w600
    ),
    labelLarge: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w400
    ),
    labelMedium: TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: FontWeight.w400
    ),
    labelSmall: TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.w400
    ),
  ).apply(
    fontFamily: GoogleFonts.inter().fontFamily
  );
}