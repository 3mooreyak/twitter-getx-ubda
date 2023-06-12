import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/third-screen.dart';
import 'widgets/second-screen.dart';
import 'widgets/first-screen.dart';
import '../C/main-controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  MainScreenController mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.pageName[controller.tabIndex]),
          ),
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              const FirstScreen(),
              const SecondScreen(),
              ThirdScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
