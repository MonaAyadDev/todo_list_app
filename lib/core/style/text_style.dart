import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';

abstract class TextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(fontSize: 16);
  static const TextStyle caption1 = TextStyle(fontSize: 14);
  static const TextStyle caption2 = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );
  static const TextStyle title2 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
}
