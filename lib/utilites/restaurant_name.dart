import 'package:assignment/controllers/like_controller.dart';
import 'package:assignment/utilites/my_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget RestaurantName() {
  LikeController controller = Get.put(LikeController());
  return Obx(
    () => Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Amerika Foods",
                style:
                    GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              MyIcon(IconButton(
                  onPressed: () {
                    controller.clicked.value = !controller.clicked.value;
                  },
                  icon: controller.clicked.value
                      ? Icon(
                          Icons.favorite,
                          color: Colors.redAccent[400],
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black
                        )))
            ],
          ),
          Text(
            "American, Fast Food, Burgers",
            style: GoogleFonts.lato(fontSize: 15, letterSpacing: 0.5, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "4.5",
                style:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 14),
              Divider(),
              const SizedBox(width: 16),
              const Icon(
                Icons.message_outlined,
                color: Colors.green,
                size: 16,
              ),
              const SizedBox(width: 7),
              Text(
                "1K+ reviews",
                style:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 14,
              ),
              Divider(),
              const SizedBox(
                width: 14,
              ),
              const Icon(
                Icons.access_time,
                color: Colors.blue,
                size: 16,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "15 mins",
                style:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget Divider() {
  return Container(
    color: Colors.black,
    width: 0.5,
    height: 20,
  );
}
