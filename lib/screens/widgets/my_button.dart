import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/constants/layouts.dart';
import 'package:todoapp/viewmodels/login_view_model.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;
  final IconData icon;

  const MyButton({
    Key key,
    @required this.onPressed,
    this.color = kBlueColor,
    @required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FittedBox(
      child: FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: kDefaultBorderRadius,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.bodyText1,
            ),
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
