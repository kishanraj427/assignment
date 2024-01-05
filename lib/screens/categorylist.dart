import 'package:assignment/controllers/category_controller.dart';
import 'package:assignment/utilites/lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget CategoryList() {
  CategoryController controller = Get.put(CategoryController());
  return SizedBox(
    height: Get.height * .05,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: topCategories.length,
      itemBuilder: (context, index) {
        return Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: index == controller.index.value
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.green, width: 1)))
                    : null,
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      foregroundColor: index == controller.index.value
                          ? Colors.green
                          : Colors.black87),
                  onPressed: () {
                    controller.index.value = index;
                  },
                  child: Text(topCategories[index]),
                ),
              ),
            ));
      },
    ),
  );
}
