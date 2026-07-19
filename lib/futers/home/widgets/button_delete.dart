import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/core/constans/app_constant.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/futers/tasks/data/model/task_model.dart';

class ButtonDelete extends StatelessWidget {
  const ButtonDelete({super.key, required this.onDeleted});
  final VoidCallback onDeleted; // 2) وده

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_outline_rounded, size: 30),
      color: AppColors.charcoalGrey, // أو أي لون بيتماشى مع باقي الأيقونات عندك
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Delete All Tasks'),
            content: const Text(
              'Are you sure you want to delete all tasks? This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.charcoalGrey),
                ),
              ),
              TextButton(
                onPressed: () {
                  Hive.box<TaskModel>(AppConstant.taskBox).clear();
                  Navigator.pop(context);
                  onDeleted();
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
