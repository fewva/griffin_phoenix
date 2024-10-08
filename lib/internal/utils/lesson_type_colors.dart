import 'dart:ui';

import 'package:griffin_phoenix/theme/app_colors.dart';

Color lessonTypeToColor(
  String? type, {
  int? index,
  int? nextIndex,
  bool isDarkTheme = false,
}) {
  if (index != null && nextIndex != null) {
    if (index < nextIndex) return AppColors.grey;
  }

  switch (type) {
    case 'Практика':
      return isDarkTheme ? AppColors.practiceDark : AppColors.practice;
    case 'Лекция':
      return isDarkTheme ? AppColors.lectureDark : AppColors.lecture;
    case 'Экзамен':
      return isDarkTheme ? AppColors.examDark : AppColors.exam;
    case 'Зачет':
      return isDarkTheme ? AppColors.creditDark : AppColors.credit;
    case 'Лабораторная':
      return isDarkTheme ? AppColors.labDark : AppColors.lab;
    default:
      return AppColors.green;
  }
}
