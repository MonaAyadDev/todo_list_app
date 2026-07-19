import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/app_root/main_app.dart';
import 'package:to_do_list_app/core/constans/app_constant.dart';
import 'package:to_do_list_app/futers/auth/data/model/user_model.dart';
import 'package:to_do_list_app/futers/tasks/data/model/task_model.dart';

void main() async {
  // ignore: await_only_futures
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<UserModel>(AppConstant.userBox);
  await Hive.openBox<TaskModel>(AppConstant.taskBox);

  runApp(const MainApp());
}
