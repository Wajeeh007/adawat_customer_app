import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelpers {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
  ).copyWith(
    splashFactory: NoSplash.splashFactory,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundWhite,
    textTheme: TextThemes.textTheme(color: primaryBlack),
    colorScheme: ColorScheme.fromSeed(seedColor: backgroundWhite),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: primaryBlack, iconSize: 20)),
    iconTheme: const IconThemeData(color: primaryBlack, size: 20,),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: backgroundWhite,
          scrolledUnderElevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark
        )
        // titleTextStyle:
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: primaryBlack,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          prefixIconColor: primaryBlack,
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: const BorderSide(color: lightThemeBorderGrey, width: 1.2)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: const BorderSide(color: lightThemeBorderGrey, width: 2)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: errorRed, width: 1.2),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: errorRed, width: 2),
            borderRadius: BorderRadius.circular(kBorderRadius),
          )
      ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryYellow,
    )
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true
  ).copyWith(
      textTheme: TextThemes.textTheme(color: darkThemeLightGrey),
    splashFactory: NoSplash.splashFactory,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryBlack,
    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: darkThemeLightGrey, iconSize: 20)),
    colorScheme: ColorScheme.fromSeed(seedColor: darkThemeLightGrey),
    iconTheme: const IconThemeData(color: darkThemeLightGrey, size: 20,),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryBlack,
      scrolledUnderElevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light
        )
      // titleTextStyle:
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: darkThemeLightGrey,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      prefixIconColor: darkThemeLightGrey,
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
        borderSide: const BorderSide(color: darkThemeLightGrey, width: 1.2)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        borderSide: const BorderSide(color: darkThemeLightGrey, width: 2)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: errorRed, width: 1.2),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: errorRed, width: 2),
        borderRadius: BorderRadius.circular(kBorderRadius),
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
    fontFamily: GoogleFonts.ubuntu().fontFamily
  );
}