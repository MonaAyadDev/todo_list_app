import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';

class CoustomFormFilde extends StatelessWidget {
  const CoustomFormFilde({super.key, required this.label, required this.hint});
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
        ),
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            hintText: 'enter your email',
            hintStyle: TextStyles.caption2,
          ),
        ),
      ],
    );
  }
}
