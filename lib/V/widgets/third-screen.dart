import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../C/third-controller.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreenController thirdScreenController =
      Get.put(ThirdScreenController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text("Counter ${thirdScreenController.counter.value}")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text("+"),
            onPressed: () => thirdScreenController.increaseCounter(),
          )
        ],
      ),
    );
  }
}
