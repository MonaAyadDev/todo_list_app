import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatsItem(title: 'Tasks', length: 15),
            StatsItem(title: 'Done', length: 17),
            StatsItem(title: 'In progres', length: 24),
          ],
        ),
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  const StatsItem({super.key, required this.title, required this.length});

  final String title;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          length.toString(),
          style: TextStyles.title.copyWith(color: AppColors.deepCocoa),
        ),
        Text(
          title,
          style: TextStyles.title.copyWith(color: AppColors.dustyRose),
        ),
      ],
    );
  }
}
