import 'package:flutter/material.dart';
import 'package:flutter_getx_example/V/main-screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainPage(),
    );
  }
}
