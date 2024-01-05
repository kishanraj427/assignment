import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BurgerListController extends GetxController {
  RxList burgerList = <Map>[].obs;
  RxInt totalSelected = 0.obs;
  RxInt totalAmount = 0.obs;
  @override
  void onInit() {
    FirebaseFirestore.instance.collection("Burgers").get().then((value) => {
          value.docChanges.forEach((element) {
            var burger = {
              'name': element.doc["name"],
              'count': 0.obs,
            };
            burgerList.insert(0, burger);
          })
        });

    super.onInit();
  }
}
