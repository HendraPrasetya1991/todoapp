import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/constants/layouts.dart';

class MyInputField extends StatelessWidget {
  final String error;
  final TextEditingController controller;

  const MyInputField({
    Key key,
    this.error,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: kDefaultBorderRadius,
        border: Border.all(
          color: error != null && error.isNotEmpty
              ? Colors.red
              : Colors.transparent,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none),
        controller: controller,
      ),
    );
  }
}
