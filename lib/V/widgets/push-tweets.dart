import 'package:flutter/material.dart';
import 'package:flutter_getx_example/C/first-controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Posts extends StatelessWidget {
  var user;
  var id;
  var text;
  var image;
  var profileImage;

  bool isFavorite;
  bool isComment;
  bool isRetweet;
  bool isShare;
  Posts({
    super.key,
    required this.user,
    required this.image,
    required this.text,
    required this.id,
    required this.profileImage,
    required this.isFavorite,
    required this.isComment,
    required this.isShare,
    required this.isRetweet,
  });
  FirstScreenController firstScreenController =
      Get.put(FirstScreenController());
  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        height: 350,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          profileImage,
                        ),
                        radius: 20,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    user,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    id,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      text,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  image,
                  height: 150,
                  width: 300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GetBuilder<FirstScreenController>(builder: ((controller) {
                    return InkWell(
                        onTap: () {
                          firstScreenController.changeisComment(index);

                          isComment = !isComment;
                        },
                        child: Icon(Icons.comment_outlined,
                            color: isComment == false ? null : Colors.blue));
                  })),
                  GetBuilder<FirstScreenController>(builder: ((controller) {
                    return InkWell(
                        onTap: () {
                          firstScreenController.changeisFav(index);

                          isFavorite = !isFavorite;
                        },
                        child: Icon(Icons.favorite_outlined,
                            color: isFavorite == false ? null : Colors.red));
                  })),
                  GetBuilder<FirstScreenController>(builder: ((controller) {
                    return InkWell(
                        onTap: () {
                          firstScreenController.changeisRetweet(index);

                          isRetweet = !isRetweet;
                        },
                        child: Icon(Icons.restart_alt_outlined,
                            color: isRetweet == false ? null : Colors.green));
                  })),
                  GetBuilder<FirstScreenController>(builder: ((controller) {
                    return InkWell(
                        onTap: () {
                          firstScreenController.changeisShare(index);

                          isShare = !isShare;
                        },
                        child: Icon(Icons.share_outlined,
                            color: isShare == false ? null : Colors.yellow));
                  })),
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(),
    );
  }
}
