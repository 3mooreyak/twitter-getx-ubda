import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var tabIndex = 0;
  List pageName = [
    'For you',
    'Folowing',
    'Second Screen',
    'Third Screen',
    'Third Screen'
  ];
  RxBool toggel = false.obs;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
