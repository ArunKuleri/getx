import 'package:get/get.dart';

class UpdateController extends GetxController {
  Map<String, dynamic>? arguments;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;

    if (arguments != null) {
      String name = arguments!['name'];
      String phonenumber = arguments!['phone number'].toString();
      String age = arguments!['division'].toString();
      String docId = arguments!['id'];

      // Now you can use these arguments as needed within this controller.
    }
  }
}
