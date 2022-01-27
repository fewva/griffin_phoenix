import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/utils/extensions/date_time.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

class LessonsViewModel extends BaseViewModel {
  final ILessonsService _service;
  final int? groupId;
  final int? teacherId;
  LessonsViewModel(this._service, {this.groupId, this.teacherId})
      : assert(
          groupId != null || teacherId != null,
          'groupId != null || teacherId != null',
        );

  final ItemScrollController scrollController = ItemScrollController();

  List<Lesson>? lessons;

  int? nextIndex;
  bool showNextPair = true;

  Future<void> onReady() async {
    List<Lesson>? l;

    l = groupId != null
        ? await _service.getGroupLessons(id: groupId!)
        : await _service.getTeacherLessons(id: teacherId!);

    if (l != null) lessons = [];

    if (l?.isNotEmpty ?? false) {
      lessons = teacherId != null ? _prepareTeacherLessons(l!) : l;

      final DateTime now = DateTime.now();
      // DateTime now = DateTime.parse('2021-12-10 18:28:41.017140');

      nextIndex = lessons!.indexWhere(
        (Lesson e) => e.date?.isAfter(now) ?? false,
      );

      if (nextIndex == -1) {
        nextIndex = lessons!.length - 1;
        showNextPair = false;
      }

      // nextIndex = lessons!.length - 1;
      // showNextPair = true;

      // if (nextIndex == -1) nextIndex = -1;
      // formattedLessons = groupBy(lessons!, (Lesson e) => e.date!);
    }

    notifyListeners();
  }

  void onDateChanged(DateTime day) {
    if (lessons?.isNotEmpty ?? false) {
      final int index = lessons!.indexWhere(
        (Lesson element) => element.date.onTheSameDay(day),
      );
      if (index != -1) {
        scrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 250),
        );
      }
    }
  }

  List<Lesson> _prepareTeacherLessons(List<Lesson> l) {
    if (l.isEmpty) return [];

    final List<Lesson> newLessons = [
      l.first.copyWith(
        groups: l.first.groupId != null
            ? [Group(id: l.first.groupId, name: l.first.group)]
            : null,
      )
    ];

    for (final item in l.sublist(1)) {
      if (item.isEqualForTeacher(newLessons.last)) {
        if (newLessons.last.groups != null) {
          newLessons.last.groups!
              .add(Group(id: item.groupId, name: item.group));
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
