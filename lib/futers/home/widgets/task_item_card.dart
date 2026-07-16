import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.marshmallowWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.softCoral,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flutter UI &  Design', style: TextStyles.title2),
                  Text(
                    'Design themed task screens',
                    style: TextStyles.caption2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Container(
                    alignment: Alignment(0, 0),

                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 50,
                    width: 130,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.softCoral.withAlpha(10),
                    ),
                    child: Text(
                      'Pending',
                      style: TextStyles.subtitle.copyWith(
                        color: AppColors.softCoral,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF9E9E9E),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
