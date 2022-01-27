import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';

abstract class ILessonsService {
  Future<List<Lesson>?> getGroupLessons({required int id});
  Future<List<Lesson>?> getTeacherLessons({required int id});
}
