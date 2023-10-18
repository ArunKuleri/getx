import 'package:get/get.dart';

class SidebarController extends GetxController {
  RxBool isSidebarOpen = false.obs;
  void toggleSidebar() {
    isSidebarOpen.value = !isSidebarOpen.value;
  }
}
