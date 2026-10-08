import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:to_do_app/core/models/app_constants.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/models/user_model.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<TaskModel>(AppConstants.taskBox);
  await Hive.openBox<UserModel>(AppConstants.userBox);
  // Hive.box<TaskModel>(AppConstants.taskBox).clear();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: Locale('en'),
    child: ToDoApp(),
  ));
}
