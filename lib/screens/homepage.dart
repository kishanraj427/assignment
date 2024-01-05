import 'package:assignment/screens/bodypage.dart';
import 'package:assignment/screens/categorylist.dart';
import 'package:assignment/utilites/hdivider.dart';
import 'package:assignment/utilites/restaurant_name.dart';
import 'package:assignment/utilites/top_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopWidget(),
          RestaurantName(),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 2),
            child: HDivider(),
          ),
          CategoryList(),
          HDivider(),
          Expanded(child: BodyPage()),
        ],
      ),
    );
  }
}