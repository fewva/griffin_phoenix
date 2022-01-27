import 'package:griffin_phoenix/internal/domain/data_providers/roles/i_roles_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role/i_select_role_service.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

class SelectRoleService implements ISelectRoleService {
  final IRolesDataProvider _rolesDataProvider;

  SelectRoleService(this._rolesDataProvider);

  @override
  Future<List<Group>?> searchForGroup({int? id, String? name}) async {
    assert(id != null || name != null, 'id != null || name != null');
    try {
      final ApiDTO? result = await _rolesDataProvider.searchForGroup(id, name);

      if (result?.status == 0) {
        final List<Group> groups = result!.response
            .map((e) => Group.fromJson(e))
            .cast<Group>()
            .toList();

        return groups;
      }
    } catch (e) {
      printError(e);
    }
  }

  @override
  Future<List<Teacher>?> searchForTeacher({int? id, String? name}) async {
    assert(id != null || name != null, 'id != null || name != null');
    try {
      final ApiDTO? result =
          await _rolesDataProvider.searchForTeacher(id, name);

      if (result?.status == 0) {
        final List<Teacher> teachers = result!.response
            .map((e) => Group.fromJson(e))
            .cast<Group>()
            .toList();

        return teachers;
      }
    } catch (e) {
      printError(e);
    }
  }
}
