import 'package:griffin_phoenix/internal/domain/services/lessons_service.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

import 'package:collection/collection.dart';

class LessonsViewModel extends BaseViewModel {
  final _service = locator<LessonsService>();

  final int? groupId;
  final int? teacherId;

  final ItemScrollController scrollController = ItemScrollController();

  LessonsViewModel({this.groupId, this.teacherId});

  List<Lesson>? lessons;
  Map<DateTime, List<Lesson>>? formattedLessons;

  int? todayIndex = 0;

  Future<void> onReady() async {
    List<Lesson>? l;

    if (groupId != null) {
      l = await _service.getGroupLessons(id: groupId!);
    } else {
      l = await _service.getTeacherLessons(id: teacherId!);
    }
    if (l != null) {
      lessons = teacherId != null ? _prepareTeacherLessons(l) : l;

      // todayIndex = lessons!.indexWhere(
      //   (Lesson e) =>
      //       DateTime.tryParse(e.date!)?.isAfter(DateTime.now()) ?? false,
      // );
      // todayIndex = 40;
      // formattedLessons = groupBy(lessons!, (Lesson e) => e.date!);
      if (todayIndex == -1) todayIndex = -1;
    }
    lessons ??= [];
    notifyListeners();
  }

  List<Lesson> _prepareTeacherLessons(List<Lesson> l) {
    if (l.isEmpty) return [];

    final List<Lesson> newLessons = [l.first];

    for (final item in l.sublist(1)) {
      if (item.isEqualForTeacher(newLessons.last)) {
        if (newLessons.last.groups != null) {
          newLessons.last.groups!
              .add(Group(id: item.groupId, name: item.group));
        } else {
          newLessons.last.groups = [
            if (newLessons.last.groupId != null)
              Group(id: newLessons.last.groupId, name: newLessons.last.group),
            Group(id: item.groupId, name: item.group),
          ];
        }
      } else {
        newLessons.add(
          item.copyWith(
            groups: item.groupId != null
                ? [Group(id: item.groupId, name: item.group)]
                : null,
          ),
        );
      }
    }
    return newLessons;
  }
}
