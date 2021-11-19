import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/constants/layouts.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/widgets/my_button.dart';
import 'package:todoapp/utils/text_validator.dart';
import 'package:todoapp/viewmodels/login_view_model.dart';

import 'widgets/my_input_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Consumer<LoginViewModel>(
                builder: (_, model, __) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyInputField(
                      controller: _usernameController,
                      error: model.error,
                    ),
                    if (model.error != null && model.error.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          model.error,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MyButton(
                text: 'Next',
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  Provider.of<LoginViewModel>(context, listen: false)
                      .validate(_usernameController.text);
                },
                color: kGreenColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
