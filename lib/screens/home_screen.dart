import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/constants/layouts.dart';
import 'package:todoapp/screens/widgets/add_todo_modal.dart';
import 'package:todoapp/screens/widgets/todo_item.dart';
import 'package:todoapp/viewmodels/todos_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addTodoModal(BuildContext context) {
    showDialog(context: context, builder: (ctx) => AddTodoModal());
  }

  @override
  void initState() {
    super.initState();
    Provider.of<TodosViewModel>(context, listen: false).loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final todosViewModel = Provider.of<TodosViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          kDefaultPadding / 2,
          60,
          kDefaultPadding / 2,
          0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, John Doe',
                style: textTheme.headline1,
              ),
              SizedBox(
                height: kDefaultPadding * 4 / 5,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: todosViewModel.todos
                    .map((todoViewModel) => Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: TodoItem(todoViewModel.todo)))
                    .toList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kGreenColor,
        foregroundColor: kBackGroundColor,
        onPressed: () => _addTodoModal(context),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
