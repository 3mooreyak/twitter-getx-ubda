import 'package:flutter/material.dart';
import 'package:flutter_getx_example/V/widgets/login/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.cyan,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          text: text,
          color: Colors.white,
          underLine: TextDecoration.none),
    );
  }
}
