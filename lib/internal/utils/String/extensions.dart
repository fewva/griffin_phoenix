import 'package:griffin_phoenix/internal/utils/String/lists.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';

extension ReadableDate on DateTime? {
  String? get toReadableDate {
    if (this != null) {
      return '${this!.day} ${StringLists.months[this!.month - 1]} (${StringLists.weekdays[this!.weekday - 1]})';
    }
    printError('Отсутствует дата!');
    return '';
  }
}
