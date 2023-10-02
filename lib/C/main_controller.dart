import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
   
  ].obs;

  final title = [
    'Asroo Shop',
    'Categories',
    'Favorites',
    'Settinges',
  ].obs;
}
