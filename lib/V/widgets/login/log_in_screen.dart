import 'package:flutter/material.dart';
import 'package:flutter_getx_example/V/widgets/login/text_utils.dart';
import 'package:get/get.dart';

import '../../../C/auth_controller.dart';
import '../../../routes/routes.dart';
import 'auth_button.dart';
import 'auth_text_from_field.dart';
import 'container_under.dart';
import 'my_string.dart';

class LoginScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'LOG IN',
                              color: Colors.cyan,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
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
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.cyan,
                          size: 30,
                        ),
                        suffixIcon: Text(''),
                        hintText: 'Email ',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (Value) {
                              if (Value.toString().length < 6) {
                                return 'password should be longer or equal to 6 chractars';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.cyan,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            hintText: 'Password ',
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPsswordScreen);
                            },
                            child: TextUtils(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                text: 'Forgot Password?',
                                color: Colors.white,
                                underLine: TextDecoration.none)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();

                              controller.logInUsingFirebase(
                                  email: email, password: password);
                            }
                          },
                          text: 'LOG IN ',
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
              text: 'Dont have an account ?   ',
              textType: 'Sign Up',
            )
          ],
        )),
      ),
    );
  }
}
