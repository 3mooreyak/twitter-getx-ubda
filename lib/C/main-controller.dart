import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var tabIndex = 0;
  List pageName = ['First Screen', 'Second Screen', 'Third Screen'];

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
