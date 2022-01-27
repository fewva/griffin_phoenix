import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/irole.dart';

abstract class IDataStorageService {
  Future init();

  Future<IRole?> getLastRole();

  Future<List<Lesson>>? getGroupSchedule(int id);
  Future<List<Lesson>>? getTeacherSchedule(int id);

  Future<void> saveSchedule(List<Lesson> schedule);
  Future<void> saveRole(IRole role);
}
