import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/core/constans/app_constant.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';
import 'package:to_do_list_app/futers/auth/data/model/user_model.dart';
import 'package:to_do_list_app/futers/home/widgets/button_delete.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.onTaskDeleted});
  final VoidCallback onTaskDeleted;
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<UserModel>(AppConstant.userBox);
    final userData = box.isNotEmpty ? box.getAt(0) : null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage:
                userData?.image != null && userData!.image.isNotEmpty
                ? Image.file(File(userData.image)).image
                : const AssetImage('assets/images/default_avatar.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('good morning 🧠', style: TextStyles.caption2),
                Text(
                  userData?.name ?? "Guest",
                  style: TextStyles.title.copyWith(
                    color: AppColors.charcoalGrey,
                  ),
                ),
              ],
            ),
          ),
          ButtonDelete(onDeleted: onTaskDeleted),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.charcoalGrey,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
