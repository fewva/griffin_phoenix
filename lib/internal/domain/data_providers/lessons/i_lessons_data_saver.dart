import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

abstract class ILessonsDataSaver {
  Future<void> saveGroupsLessons(Group group, List<Lesson> lessons);
  Future<void> saveTeacherLessons(Teacher teacher, List<Lesson> lessons);
}
