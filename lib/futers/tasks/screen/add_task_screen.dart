import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/core/constans/app_constant.dart';
import 'package:to_do_list_app/core/widgets/coustom__form_filde.dart';
import 'package:to_do_list_app/core/widgets/main_button.dart';
import 'package:to_do_list_app/futers/tasks/data/model/task_model.dart';
import 'package:to_do_list_app/futers/tasks/widget/task_color_list.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isSaving = false; // 1) ضيف الفلاج ده

  var formKay = GlobalKey<FormState>();
  final titleControler = TextEditingController();
  final descptionControler = TextEditingController();
  final dateControler = TextEditingController();
  int? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKay,
            child: Column(
              children: [
                CoustomFormFilde(
                  label: 'Task Title',
                  hint: 'hinthinthinthinthint',
                  controller: titleControler,
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (value!.isEmpty) {
                      return 'Please enter Task Title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CoustomFormFilde(
                  controller: descptionControler,
                  label: 'Description',
                  hint: 'hinthinthinthint',
                  maxLines: 10,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CoustomFormFilde(
                  controller: dateControler,
                  label: 'Status',
                  hint: 'hinthinthint',
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2027),
                    ).then((v) {
                      dateControler.text = DateFormat.yMd().format(
                        v ?? DateTime.now(),
                      );
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Choose Color '),
                TaskColorList(
                  onValue: (c) {
                    color = c?.toARGB32();
                  },
                ),
                SizedBox(height: 20),
                MainButton(
                  text: 'save task',
                  onPressed: () {
                    if (isSaving) return;
                    if (color == null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('error'),
                          content: Text('pleas choose color'),
                        ),
                      );
                      return;
                    }

                    if (formKay.currentState?.validate() ?? false) {
                      isSaving = true;
                      Hive.box<TaskModel>(AppConstant.taskBox).add(
                        TaskModel(
                          color: color!,
                          date: dateControler.text,
                          descrtion: descptionControler.text,
                          title: titleControler.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
