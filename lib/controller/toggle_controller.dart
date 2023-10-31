import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeController extends GetxController {
  Rx<ThemeMode> themeMode = Rx<ThemeMode>(ThemeMode.light);

  changeTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    return themeMode.value;
  }
}
