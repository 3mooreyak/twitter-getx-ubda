import 'package:flutter/material.dart';
import 'package:flutter_getx_example/routes/routes.dart';
import 'package:get/get.dart';

import '../../C/auth_controller.dart';
import '../../C/first-controller.dart';
import '../../M/tweets-model.dart';
import 'add_text_tweets.dart';
import 'login/log_in_screen.dart';

class AddTweets extends StatelessWidget {
  AddTweets({super.key});
  final controller = Get.find<FirstScreenController>();
  final authController = Get.find<AuthController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.off(Routes.loginScreen);
                    // Get.back();
                  },
                  child: Text(
                    'إلغاء',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.tweets.add(
                      Post(
                        UserName: authController.displayUserName.value,
                        IdName: '@${authController.displayUserName.value}',
                        Text: controller.myController.text,
                        Images: 'images/zoro.jpeg',
                        ImageProfile: 'images/zoro.jpeg',
                        isFavorite: false,
                        isComment: false,
                        isRetweet: false,
                        isShare: false,
                      ),
                    );
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'نشر',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            AddTextTweets(),
          ],
        ),
      ),
    );
  }
}
