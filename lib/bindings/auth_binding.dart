

import 'package:get/get.dart';

import '../C/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
   
  }


}