import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/screens/widgets/date_placeholder.dart';
import 'package:todoapp/screens/widgets/my_button.dart';
import 'package:todoapp/screens/widgets/my_input_field.dart';

class AddTodoModal extends StatefulWidget {
  @override
  _AddTodoModalState createState() => _AddTodoModalState();
}

class _AddTodoModalState extends State<AddTodoModal> {
  final taskController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      backgroundColor: kBackGroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Todo',
            style: textTheme.headline4,
          ),
          SizedBox(height: 18),
          Text(
            'Title',
            style: textTheme.bodyText1,
          ),
          SizedBox(height: 8),
          MyInputField(controller: taskController),
          SizedBox(height: 16),
          Text(
            'Due date',
            style: textTheme.bodyText1,
          ),
          SizedBox(height: 8),
          DatePlaceholder(),
          Container(
            padding: EdgeInsets.only(top: 24),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyButton(onPressed: () {}, text: 'Save'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: textTheme.bodyText1.copyWith(color: kGreyLabelColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
