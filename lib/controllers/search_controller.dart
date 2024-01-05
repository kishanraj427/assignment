import 'package:assignment/controllers/burgerlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  RxList burgerList = Get.find<BurgerListController>().burgerList;
  final searchedText = TextEditingController().obs;
  RxList searchList = [].obs;

  @override
  void onInit() {
    for (int i = 0; i < burgerList.length; i++) {
      searchList.add(i);
    }
    super.onInit();
  }

  void searchBurger(String name) {
    searchList.clear();
    for (int i = 0; i < burgerList.length; i++) {
      if (burgerList[i]['name'].toLowerCase().contains(""+name.toLowerCase())) {
        searchList.add(i);
      }
    }
  }
}
