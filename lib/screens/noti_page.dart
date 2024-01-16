import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotiPage extends StatefulWidget {
  String text;
  NotiPage({super.key, required this.text});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(widget.text),
        ),
      ),
    );
  }
}
