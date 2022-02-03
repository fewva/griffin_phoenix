import 'package:easy_localization/easy_localization.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_saver.dart';
import 'package:griffin_phoenix/internal/domain/network/core_api2.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/i_data_storage_service.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';
import 'package:griffin_phoenix/models/dto/role_dto.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';
import 'package:hive/hive.dart';

class LessonsService implements ILessonsService {
  final ILessonsDataProvider _localLessonsProvider;
  final ILessonsDataProvider _remoteLessonsProvider;
  final ILessonsDataSaver _iLessonsDataSaver;

  LessonsService(
    this._localLessonsProvider,
    this._remoteLessonsProvider,
    this._iLessonsDataSaver,
  );

  @override
  Future<List<Lesson>?> getGroupLessons({required Group group}) async {
    try {
      final ApiDTO? result = await _remoteLessonsProvider.getGroupLessons(
        groupId: group.id!,
        // hash: group.lastScheduleHash,
      );

      if (result?.status == 0) {
        final List<Lesson> lessons = result!.response
            .map((e) => Lesson.fromJson(e))
            .cast<Lesson>()
            .toList();

        await _iLessonsDataSaver.saveGroupsLessons(
          group.copyWith(lastScheduleHash: result.hash),
          lessons,
        );

        return lessons;
      } else if (result?.status == 1) {
        final DateTime startTime = DateTime.now();

        final ApiDTO? data =
            await _localLessonsProvider.getGroupLessons(groupId: group.id!);

        if (data?.error != null) throw Exception(data!.error);

        final List<Lesson> lessons = data!.response;
        final DateTime endTime = DateTime.now();
        printWarning(
          '(${endTime.difference(startTime).inMilliseconds} ms)',
        );

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
  Future<List<Lesson>?> getTeacherLessons({required Teacher teacher}) async {
    try {
      final ApiDTO? result = await _remoteLessonsProvider.getTeacherLessons(
        teacherId: teacher.id!,
      );

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
