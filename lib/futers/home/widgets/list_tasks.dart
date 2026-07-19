import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list_app/core/constans/app_constant.dart';
import 'package:to_do_list_app/futers/home/widgets/task_item_card.dart';
import 'package:to_do_list_app/futers/tasks/data/model/task_model.dart';

// ignore: must_be_immutable
class ListTasks extends StatelessWidget {
  ListTasks({super.key});
  List<TaskModel> allTask = Hive.box<TaskModel>(
    AppConstant.taskBox,
  ).values.toList();
  @override
  Widget build(BuildContext context) {
    return allTask.isEmpty
        ? Lottie.asset("assets/icons/empty.json")
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  TaskItemCard(task: allTask[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 29),
              itemCount: allTask.length,
            ),
          );
  }
}
