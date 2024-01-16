import 'package:assignment/apis/send_fcm.dart';
import 'package:assignment/screens/searchpage.dart';
import 'package:assignment/utilites/my_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget TopWidget() {
  return Stack(
    children: [
      Image(
        image: const AssetImage("assets/images/top.jpg"),
        fit: BoxFit.cover,
        height: Get.height * .25,
        width: Get.width,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: MyIcon(IconButton(
              onPressed: () async{
                await sendMessage();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ))),
          actions: [
            MyIcon(IconButton(
                onPressed: () {
                  Get.to(() => SearchPage());
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ))),
            MyIcon(IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_rounded,
                  color: Colors.black,
                )))
          ],
        ),
      )
    ],
  );
}
