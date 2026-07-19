import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';

class TaskColorList extends StatefulWidget {
  final Function(Color?) onValue;
  const TaskColorList({super.key, required this.onValue});

  @override
  State<TaskColorList> createState() => _TaskColorListState();
}

int activeIndex = -1;

class _TaskColorListState extends State<TaskColorList> {
  List<Color> tasksColor = [
    AppColors.softTeal,
    AppColors.tango,
    AppColors.softLavender,
    AppColors.softCoral,
    AppColors.primary,
    AppColors.dustyRose,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              activeIndex = index;
              widget.onValue(tasksColor[index]);
            });
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: tasksColor[index],
            child: activeIndex == index ? Icon(Icons.check) : null,
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 7),
        itemCount: tasksColor.length,
      ),
    );
  }
}
