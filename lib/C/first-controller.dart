import 'package:get/get.dart';

import '../M/tweets-model.dart';

class FirstScreenController extends GetxController {
  List tweets = [
    Post(
      UserName: 'Zoro',
      IdName: '@Zoro-_-',
      Text: 'Iam strong',
      Images: 'images/zoro.jpeg',
      ImageProfile: 'images/zoro.jpeg',
      isFavorite: false,
      isComment: false,
      isRetweet: false,
      isShare: false,
    ),
    Post(
      UserName: 'Luffy',
      IdName: '@Luffy-_-',
      Text: 'iam king',
      Images: 'images/luffy.jpeg',
      ImageProfile: 'images/luffy.jpeg',
      isFavorite: false,
      isComment: false,
      isRetweet: false,
      isShare: false,
    ),
    Post(
      UserName: 'Nika',
      IdName: '@Nika-_-',
      Text: 'Iam king Pirates',
      Images: 'images/nika.jpeg',
      ImageProfile: 'images/nika.jpeg',
      isFavorite: false,
      isComment: false,
      isRetweet: false,
      isShare: false,
    ),
    Post(
      UserName: 'Shanks',
      IdName: '@Shanks-_-',
      Text: 'Iam teatcher',
      Images: 'images/shanks.jpeg',
      ImageProfile: 'images/shanks.jpeg',
      isFavorite: false,
      isComment: false,
      isRetweet: false,
      isShare: false,
    ),
    Post(
      UserName: 'Sir',
      IdName: '@Sir-_-',
      Text: 'Iam A sir',
      Images: 'images/sir.jpeg',
      ImageProfile: 'images/sir.jpeg',
      isFavorite: false,
      isComment: false,
      isRetweet: false,
      isShare: false,
    ),
    Post(
      UserName: 'Sanjy',
      IdName: '@Sanjy-_-',
      Text: 'Iam A Prince',
      Images: 'images/sanjy.jpeg',
      ImageProfile: 'images/sanjy.jpeg',
      isFavorite: false,
      isComment: false,
      isRetweet: false,
      isShare: false,
    ),
  ].obs;

  void changeisComment(int index) {
    tweets[index].isComment = !tweets[index].isComment;
    update();
  }

  void changeisFav(int index) {
    tweets[index].isFavorite = !tweets[index].isFavorite;
    update();
  }

  void changeisShare(int index) {
    tweets[index].isShare = !tweets[index].isShare;
    update();
  }

  void changeisRetweet(int index) {
    tweets[index].isRetweet = !tweets[index].isRetweet;
    update();
  }
  
}
