import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor, // لون الخلفية
    this.textColor, // لون النص
    this.icon,
    this.leadingIcon, // الأيقونة (ممكن تكون Image أو Icon)
  });

  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon; // خليناها Widget عشان تقبل أي نوع أيقونة
  final Widget? leadingIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        minimumSize: const Size(double.infinity, 67),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // لو بعت أيقونة هتظهر، لو مبعتش مش هتظهر حاجة
          if (leadingIcon != null) ...[
            leadingIcon!, // بيعرض الـ Widget اللي بعتها أياً كان نوعها
            const SizedBox(width: 12),
          ],
          Text(
            text,
            style: TextStyles.body.copyWith(
              color: textColor ?? AppColors.charcoalGrey, // لون افتراضي أبيض
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
