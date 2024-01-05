import 'package:assignment/controllers/burgerlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';

GetSnackBar snackBar() {
  BurgerListController controller =
      Get.find<BurgerListController>();
  return GetSnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    backgroundColor: Colors.white,
    boxShadows: const [
      BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1)
    ],
    messageText: Container(
      height: 50,
      child: Obx(()=>Row(
        children: [
          const SizedBox(width: 10,),
          Text(
            "${controller.totalSelected.value} item",
            style: GoogleFonts.lato(
                color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 0.3,
            height: 20,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "₹ ${controller.totalAmount.value}",
            style: GoogleFonts.lato(
                color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    ),
    mainButton: GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            "View cart",
            style: GoogleFonts.lato(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
    isDismissible: false,
  );
}
