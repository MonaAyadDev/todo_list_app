import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String descrtion;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;
  TaskModel({
    required this.color,
    required this.date,
    required this.descrtion,
    required this.title,
  });
}
