import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  CollectionReference tweets = FirebaseFirestore.instance.collection("tweets");

  addTweet() async {}
}
