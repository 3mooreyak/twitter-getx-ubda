import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../C/first-controller.dart';

class AddTextTweets extends StatelessWidget {
  AddTextTweets({super.key});

  final controller = Get.find<FirstScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: controller.myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Your Tweets',
            ),
          ),
        ),
      ],
    );
  }
}
