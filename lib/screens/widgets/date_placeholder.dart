import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/constants/layouts.dart';

class DatePlaceholder extends StatefulWidget {
  @override
  _DatePlaceholderState createState() => _DatePlaceholderState();
}

class _DatePlaceholderState extends State<DatePlaceholder> {
  var date = DateTime.now();

  Future<void> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(now.year, now.month + 1, 0),
    );

    setState(() {
      date = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDatePicker(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: kCardBackgroundColor,
          borderRadius: kDefaultBorderRadius,
        ),
        child: Text(
          DateFormat('dd MMMM yyyy hh:mma').format(date),
        ),
      ),
    );
  }
}
