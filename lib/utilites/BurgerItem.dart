import 'dart:math';
import 'package:assignment/controllers/burgerlist_controller.dart';
import 'package:assignment/utilites/hdivider.dart';
import 'package:assignment/utilites/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget BurgerItem(int index, String name) {
  BurgerListController controller =
      Get.find<BurgerListController>();
  int n = Random().nextInt(5);
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage("assets/images/img${n + 1}.jpg"),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  )),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Something Something Something Something Something",
                        style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹ 209",
                            style: GoogleFonts.lato(
                                color: Colors.black87,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(() => Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (controller
                                                .burgerList[index]["count"]
                                                .value ==
                                            0) return;
                                        controller
                                            .burgerList[index]["count"].value--;
                                        controller.totalAmount.value -= 209;
                                        controller.totalSelected.value--;
                                        if (controller.totalSelected.value ==
                                            0) {
                                          Get.closeCurrentSnackbar();
                                        }
                                      },
                                      child: ActionButton(
                                          "-",
                                          controller.burgerList[index]["count"]
                                                  .value >
                                              0)),
                                  const SizedBox(width: 10),
                                  Text(
                                    controller.burgerList[index]["count"].value
                                        .toString(),
                                    style: GoogleFonts.lato(
                                        color: Colors.black87,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                      onTap: () {
                                        controller
                                            .burgerList[index]["count"].value++;
                                        controller.totalAmount.value += 209;
                                        controller.totalSelected.value++;
                                        if (controller.totalSelected.value ==
                                            1) {
                                          Get.showSnackbar(
                                              snackBar());
                                        }
                                      },
                                      child: ActionButton("+", true)),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
      HDivider()
    ],
  );
}

Widget ActionButton(String text, bool isActive) {
  return Container(
    width: 32,
    height: 32,
    decoration: BoxDecoration(
        color: isActive ? Color.fromARGB(35, 76, 175, 79) : Colors.transparent,
        border: Border.all(
            width: 1, color: isActive ? Colors.green : Colors.black26),
        borderRadius: BorderRadius.circular(6)),
    alignment: Alignment.center,
    child: Text(
      text,
      style: GoogleFonts.lato(
          color: isActive ? Colors.green : Colors.black26, fontSize: 25),
    ),
  );
}

