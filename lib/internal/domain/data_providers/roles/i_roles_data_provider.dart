import 'package:griffin_phoenix/models/dto/api_dto.dart';

abstract class IRolesDataProvider {
  Future<ApiDTO?> searchForGroup(int? id, String? name);
  Future<ApiDTO?> searchForTeacher(int? id, String? name);
}
