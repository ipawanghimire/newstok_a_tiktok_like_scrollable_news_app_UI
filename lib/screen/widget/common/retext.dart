import 'dart:ffi';

import 'package:flutter/material.dart';

class ReText extends StatelessWidget {
  String text;
  Color textcolor;
  FontWeight? weight;
  double? size;

  ReText(
      {required this.text,
      this.weight,
      required this.textcolor,
      this.size,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: textcolor,
          fontWeight: weight,
        ),
      ),
    );
  }
}
