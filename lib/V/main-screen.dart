import 'package:flutter/material.dart';
import 'package:flutter_getx_example/V/widgets/add_tweets.dart';
import 'package:flutter_getx_example/V/widgets/profile-page.dart';
import 'package:get/get.dart';
import 'widgets/third-screen.dart';
import 'widgets/second-screen.dart';
import 'widgets/first-screen.dart';
import '../C/main-controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  MainScreenController mainScreenController = Get.put(MainScreenController());

  var myproducts = 'https://fakestoreapi.com/products';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Get.to(AddTweets());
            },
          ),
          appBar: controller.tabIndex == 0
              ? AppBar(
                  backgroundColor: Colors.white,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.toggel.value = false;
                        },
                        child: Text(
                          controller.pageName[0],
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Image.asset(
                          'images/logo.png',
                          width: 27,
                          height: 27,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.toggel.value = true;
                        },
                        child: Text(controller.pageName[1],
                            style: const TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  actions: [
                      InkWell(
                        onTap: () {
                          Get.to(const Profile());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const Profile()),
                          // );
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(bottom: 35),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                'images/nika.jpeg',
                              ),
                              radius: 13,
                            )),
                      )
                    ])
              : AppBar(
                  title: Text(controller.pageName[controller.tabIndex]),
                  backgroundColor: Colors.amber,
                ),
          body: Obx(
            () => IndexedStack(
              index: controller.tabIndex,
              children: [
                controller.toggel.value ? TweetScreen() : const Text('data'),
                const SecondScreen(),
                ThirdScreen(),
                ThirdScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            // fixedColor: Colors.blue,
            // backgroundColor: Colors.blue,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
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
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
