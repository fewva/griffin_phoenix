import 'package:easy_localization/easy_localization.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/network/core_api2.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/i_data_storage_service.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';
import 'package:griffin_phoenix/models/dto/role_dto.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:hive/hive.dart';

class LessonsService implements ILessonsService {
  final ILessonsDataProvider _dataProvider;

  final IDataStorageService _storageService;

  LessonsService(this._dataProvider, this._storageService);

  @override
  Future<List<Lesson>?> getGroupLessons({required int id}) async {
    try {
      final ApiDTO? result = await _dataProvider.getGroupLessons(groupId: id);

      if (result?.status == 0) {
        final List<Lesson> lessons = result!.response
            .map((e) => Lesson.fromJson(e))
            .cast<Lesson>()
            .toList();

        return lessons;
      }
    } catch (e) {
      printError(e);
    }

    // final String url = _api.getLessonsUrl(groupId: id);

    // final ApiDTO result = await _api.getRequest(url);

    // RoleDTO r = RoleDTO(item: Group(), role: Roles.group);

    // if (result.status == 0) {
    //   try {
    //     final List<Lesson> lessons = result.response
    //         .map((e) => Lesson.fromJson(e))
    //         .cast<Lesson>()
    //         .toList();

    //     final schedulesBox = await Hive.openLazyBox('schedules');

    //     await schedulesBox.put(lessons.first.groupId, result.toJson());

    //     print('schedulesBox.keys: ${schedulesBox.keys}');

    //     final gr = await schedulesBox.get(lessons.first.groupId);
    //     print('gr: ${gr}');

    //     return lessons;
    //   } catch (e) {
    //     printError(e);
    //   }
    // }
  }

  @override
  Future<List<Lesson>?> getTeacherLessons({required int id}) async {
    try {
      final ApiDTO? result =
          await _dataProvider.getTeacherLessons(teacherId: id);

      if (result?.status == 0) {
        final List<Lesson> lessons = result!.response
            .map((e) => Lesson.fromJson(e))
            .cast<Lesson>()
            .toList();

        return lessons;
      }
    } catch (e) {
      printError(e);
    }
  }
}
