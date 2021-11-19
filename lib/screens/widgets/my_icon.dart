import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;

  MyIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kBackGroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: kGreyLabelColor,
      ),
    );
  }
}
