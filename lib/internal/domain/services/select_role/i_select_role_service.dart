import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

abstract class ISelectRoleService {
  Future<List<Group>?> searchForGroup({int? id, String? name});
  Future<List<Teacher>?> searchForTeacher({int? id, String? name});
}
