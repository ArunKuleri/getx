// ignore_for_file: file_names

import 'package:get/get.dart';

class UpdateController extends GetxController {
  Map<String, dynamic>? arguments;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;

    if (arguments != null) {
      // Now you can use these arguments as needed within this controller.
    }
  }
}
