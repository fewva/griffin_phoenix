import 'package:griffin_phoenix/internal/domain/network/core_api.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/api_dto.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';

class LessonsService {
  final _api = locator<CoreApi>();

  Future<List<Lesson>?> getGroupLessons({required int id}) async {
    final String url = _api.getLessonsUrl(groupId: id);

    final ApiDTO result = await _api.getRequest(url);

    if (result.response != null && result.response is List) {
      try {
        final List<Lesson> lessons = result.response
            .map((e) => Lesson.fromJson(e))
            .cast<Lesson>()
            .toList();

        return lessons;
      } catch (e) {
        printError(e);
      }
    }
  }

  Future<List<Lesson>?> getTeacherLessons({required int id}) async {
    final String url = _api.getLessonsUrl(teacherId: id);

    final ApiDTO result = await _api.getRequest(url);

    if (result.response != null && result.response is List) {
      try {
        final List<Lesson> lessons = result.response
            .map((e) => Lesson.fromJson(e))
            .cast<Lesson>()
            .toList();

        return lessons;
      } catch (e) {
        printError(e);
      }
    }
  }
}
