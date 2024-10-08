import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

abstract class ILessonsService {
  Future<List<Lesson>?> getGroupLessons({required Group group});
  Future<List<Lesson>?> getTeacherLessons({required Teacher teacher});
}
