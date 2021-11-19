import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/repositories.dart/todo_repository.dart';
import 'package:todoapp/services/navigation_service.dart';
import 'package:todoapp/viewmodels/todo_view_model.dart';
import 'package:todoapp/viewmodels/todos_view_model.dart';
import 'package:todoapp/viewmodels/login_view_model.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => NavigationService());
  sl.registerLazySingleton(() => TodoRepository(sl()));
  sl.registerFactory(() => LoginViewModel(sl()));
  sl.registerFactory(() => TodosViewModel(sl()));
  sl.registerFactory(() => TodoViewModel(sl()));
}
