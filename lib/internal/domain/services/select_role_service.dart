import 'package:griffin_phoenix/internal/domain/network/core_api.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/api_dto.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

class SelectRoleService {
  final _api = locator<CoreApi>();

  Future<List<Group>?> searchForGroup({int? id, String? name}) async {
    final String url = _api.getGroupsUrl(id: id, name: name);

    final ApiDTO result = await _api.getRequest(url);

    if (result.response != null && result.response is List) {
      try {
        final List<Group> groups = result.response
            .map((e) => Group.fromJson(e))
            .cast<Group>()
            .toList();

        return groups;
      } catch (e) {
        printError(e);
      }
    }
  }

  Future<List<Teacher>?> searchForTeacher({int? id, String? name}) async {
    final String url = _api.getTeachersUrl(id: id, name: name);

    final ApiDTO result = await _api.getRequest(url);

    if (result.response != null && result.response is List) {
      try {
        final List<Teacher> teachers = result.response
            .map((e) => Teacher.fromJson(e))
            .cast<Teacher>()
            .toList();

        return teachers;
      } catch (e) {
        printError(e);
      }
    }
  }
}
