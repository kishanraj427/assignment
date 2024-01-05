import 'package:flutter/material.dart';

Widget MyIcon(IconButton icon) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.25)
        ),
      ),
      icon
    ],
  );
}
