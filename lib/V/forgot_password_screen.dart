import 'package:flutter/material.dart';
import 'package:flutter_getx_example/V/widgets/login/auth_button.dart';
import 'package:flutter_getx_example/V/widgets/login/auth_text_from_field.dart';
import 'package:flutter_getx_example/V/widgets/login/my_string.dart';
import 'package:get/get.dart';

import '../C/auth_controller.dart';

class ForgotPsswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();
  ForgotPsswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(color: Get.isDarkMode ? Colors.pink : Colors.green),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'if you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: (Value) {
                      if (!RegExp(validationEmail).hasMatch(Value)) {
                        return 'envaild email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Icon(
                            Icons.email,
                            color: Colors.pink,
                            size: 30,
                          )
                        : Image.asset('assets/images/email.png'),
                    suffixIcon: Text(''),
                    hintText: 'Email ',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            String email = emailController.text.trim();
                            controller.resetPassword(email);
                          }
                        },
                        text: 'SEND');
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
