import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/constants/layouts.dart';
import 'package:todoapp/entities/todo.dart';
import 'package:todoapp/screens/widgets/label.dart';
import 'package:todoapp/screens/widgets/my_button.dart';
import 'package:todoapp/screens/widgets/my_icon.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(
    this.todo, {
    Key key,
  }) : super(key: key);

  String mapCompleteToLabel() {
    return todo.complete ? 'Open' : 'Done';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: kDefaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(mapCompleteToLabel(),
                  todo.complete ? kGreenColor : kRedColor),
              MyIcon(Icons.delete_outline_rounded),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      // todo.task,
                      'Submit Code Review',
                      style: textTheme.headline4,
                    ),
                  ),
                  Text('Due date:'),
                  SizedBox(height: 2),
                  Text('21 October 2021 07:30 PM'),
                ],
              ),
              MyButton(
                onPressed: () {},
                text: 'DONE',
                color: kBlueColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
