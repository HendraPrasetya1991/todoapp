import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;
import 'routes.dart';
import 'services/navigation_service.dart';
import 'theme_data.dart';
import 'viewmodels/login_view_model.dart';
import 'viewmodels/todos_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => di.sl<LoginViewModel>(),
        ),
        ChangeNotifierProxyProvider<LoginViewModel, TodosViewModel>(
          create: (_) => di.sl<TodosViewModel>(),
          update: (_, loginViewModel, todosViewModel) =>
              todosViewModel..update(loginViewModel),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        navigatorKey: di.sl<NavigationService>().navigationKey,
        theme: themeData,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: Routes.initialRoute,
      ),
    );
  }
}
