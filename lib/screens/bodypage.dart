import 'package:assignment/controllers/burgerlist_controller.dart';
import 'package:assignment/utilites/BurgerItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BodyPage() {
  BurgerListController controller =
      Get.put(BurgerListController(), permanent: true);
  return Obx(() => ListView.builder(
      padding: const EdgeInsets.only(bottom: 45),
      physics: const BouncingScrollPhysics(),
      itemCount: controller.burgerList.length,
      itemBuilder: (context, index) {
        return BurgerItem(index, controller.burgerList[index]["name"]);
      }));
}
