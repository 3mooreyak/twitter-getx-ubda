import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../routes/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';



class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  var googleSignIn = GoogleSignIn();
  var isSignedIn = false;



  final GetStorage authBox = GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get userProfile => auth.currentUser;

  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;

    super.onInit();
  }

  void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  void SignUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'Provided Password Is Too Week.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write('auth', isSignedIn);

      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            'Account Does Not Exites For That $email.. Create your Account by signing Up';
      } else if (error.code == 'wrong-password') {
        message = 'Invaild Password.. Please Try Again';
      } else {
        message = error.message.toString();
      }
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write('auth', isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void facebookSignUpApp() {}
  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            'Account Does Not Exites For That $email.. Create your Account by signing Up';
      } else {
        message = error.message.toString();
      }
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      isSignedIn = false;
      authBox.remove('auth');

      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}
