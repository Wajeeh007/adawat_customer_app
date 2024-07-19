import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Colors
const primaryBlack = Color(0xff0b0c0c);
const primaryGrey = Color(0xff2a2e34);
const primaryWhite = Color(0xffe9eaec);
const primaryYellow = Color(0xfffbe134);
const primaryDullYellow = Color(0xffe4b61a);
const darkThemeLightGrey = Color(0xffcecece);
const errorRed = Color(0xffef0000);
const backgroundWhite = Colors.white;
const lightThemeBorderGrey = Color(0xffaaaaaa);
Color darkModeShimmerBaseGrey = Colors.grey.shade900;
Color darkModeShimmerHighGrey = Colors.grey.shade800;
Color lightModeShimmerBaseGrey = Colors.grey.shade300;
Color lightModeShimmerHighGrey = Colors.grey.shade200;
Color lightModeShadowGrey = darkThemeLightGrey.withOpacity(0.6);
const pendingStatusBgColor = Color(0xffffcccc);
const completedStatusBgColor = Color(0xffb7f9a9);
const completedTextColor = Colors.green;

/// Container Shadow
List<BoxShadow> kShadow = [
  BoxShadow(
    offset: const Offset(0, 10),
    spreadRadius: 0.05,
    blurRadius: 20,
    color: Get.context!.theme.shadowColor
)];

BorderRadius kBorderRadius = BorderRadius.circular(kContainerRadius);

// /// Container Decoration
// BoxDecoration kDecoration = BoxDecoration(
//     color: Theme.of(Get.context!).colorScheme.primaryContainer,
//     boxShadow: Get.isDarkMode ? null : [kShadow],
//     borderRadius: BorderRadius.circular(kContainerRadius)
// );

/// Numerical Constants
const kContainerRadius = 15.0;

/// Type of status
enum ContainerType {pending, completed, cancelled}