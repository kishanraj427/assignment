import 'package:assignment/screens/homepage.dart';
import 'package:assignment/utilites/BurgerItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/controllers/search_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final controller = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx(() =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SearchBar(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "${controller.searchList.length} Search results...",
                    style: GoogleFonts.lato(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: controller.searchList.isEmpty? 
                  const Center(
                    child: Image(
                      image: AssetImage("assets/images/not_found.gif"),
                      fit: BoxFit.fitWidth,
                    )
                  )
                    : 
                  ListView.builder(
                  padding: const EdgeInsets.only(bottom: 45),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, index) => BurgerItem(
                      controller.searchList[index],
                      controller.burgerList[controller.searchList[index]]
                          ["name"]),
                ))
              ]))),
    );
  }

  Widget SearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.offAll(()=>const HomePage());
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black87,
              )),
          Container(
            width: Get.width * .80,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.black38)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  onPressed: () {},
                ),
                Flexible(
                  child: Obx(() => TextField(
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black87),
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search...",
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black38)),
                        controller: controller.searchedText.value,
                        onChanged: (value) {
                          controller.searchBurger(value);
                        },
                      )),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.mic_none,
                    color: Colors.black87,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
