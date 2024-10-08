import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_saver.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/hive_data_storage_service.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

class HiveLessonsDataSaver implements ILessonsDataSaver {
  HiveDataStorageService _dataStorageService;

  HiveLessonsDataSaver(this._dataStorageService);

  Future<void> saveGroupsLessons(Group group, List<Lesson> lessons) async {
    await _dataStorageService.saveSchedule(role: group, schedule: lessons);
    printWarning('saved $group');
    printWarning(lessons);
  }

  Future<void> saveTeacherLessons(Teacher teacher, List<Lesson> lessons) async {
    await _dataStorageService.saveSchedule(role: teacher, schedule: lessons);
  }
}
