import 'package:flutter/material.dart';
import 'package:flutter_getx_example/V/widgets/profile-tweets.dart';
import 'package:flutter_getx_example/V/widgets/push-tweets.dart';
import '../../C/first-controller.dart';
import 'package:get/get.dart';

//  TweetScreen

class TweetScreen extends StatelessWidget {
  TweetScreen({super.key});
  FirstScreenController firstScreenController =
      Get.put(FirstScreenController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: firstScreenController.tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(
                  Posts(
                    user: firstScreenController.tweets[index].UserName,
                    id: firstScreenController.tweets[index].IdName,
                    image: firstScreenController.tweets[index].Images,
                    text: firstScreenController.tweets[index].Text,
                    profileImage:
                        firstScreenController.tweets[index].ImageProfile,
                    isFavorite: firstScreenController.tweets[index].isFavorite,
                    isComment: firstScreenController.tweets[index].isComment,
                    isShare: firstScreenController.tweets[index].isShare,
                    isRetweet: firstScreenController.tweets[index].isRetweet,
                  ),
                  arguments: [index]);
            },
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(tweetsProfilePage(
                            tweetsProfile: firstScreenController
                                .tweets[index].ImageProfile,
                          ));
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            firstScreenController.tweets[index].ImageProfile,
                          ),
                          radius: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        firstScreenController.tweets[index].UserName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(firstScreenController.tweets[index].IdName),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          firstScreenController.tweets[index].Text,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    firstScreenController.tweets[index].Images,
                    height: 150,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GetBuilder<FirstScreenController>(builder: ((controller) {
                        return InkWell(
                            onTap: () {
                              firstScreenController.changeisComment(index);
                            },
                            child: Icon(Icons.comment,
                                color: firstScreenController
                                            .tweets[index].isComment ==
                                        false
                                    ? null
                                    : Colors.blue));
                      })),

                      // InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         tweets[index].isComment =
                      //             !tweets[index].isComment;
                      //       });
                      //     },
                      //     child: Icon(Icons.comment_outlined,
                      //         color: tweets[index].isComment == false
                      //             ? null
                      //             : Colors.blue)),
                      GetBuilder<FirstScreenController>(builder: ((controller) {
                        return InkWell(
                            onTap: () {
                              firstScreenController.changeisRetweet(index);
                            },
                            child: Icon(Icons.restart_alt_outlined,
                                color: firstScreenController
                                            .tweets[index].isRetweet ==
                                        false
                                    ? null
                                    : Colors.green));
                      })),

                      GetBuilder<FirstScreenController>(builder: ((controller) {
                        return InkWell(
                            onTap: () {
                              firstScreenController.changeisFav(index);
                            },
                            child: Icon(Icons.favorite,
                                color: firstScreenController
                                            .tweets[index].isFavorite ==
                                        false
                                    ? null
                                    : Colors.red));
                      })),
                      GetBuilder<FirstScreenController>(builder: ((controller) {
                        return InkWell(
                            onTap: () {
                              firstScreenController.changeisShare(index);
                            },
                            child: Icon(Icons.share,
                                color: firstScreenController
                                            .tweets[index].isShare ==
                                        false
                                    ? null
                                    : Colors.yellow));
                      })),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
