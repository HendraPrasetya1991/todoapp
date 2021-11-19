import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';

class Label extends StatelessWidget {
  final String text;
  final Color color;

  const Label(this.text, [this.color = kGreyLabelColor]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: kGreyLabelColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
