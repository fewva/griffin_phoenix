import 'package:griffin_phoenix/internal/domain/services/data_storage/i_data_storage_service.dart';
import 'package:griffin_phoenix/models/dto/role_dto.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/irole.dart';
import 'package:hive/hive.dart';

class HiveDataStorageService implements IDataStorageService {
  final String path;
  final HiveInterface hive;

  HiveDataStorageService({required this.path, required this.hive});

  Box? _rolesBox;

  @override
  Future<void> init() async => hive.init(path);

  Future<void> connect(String name) async => hive.openLazyBox(name);

  @override
  Future<IRole?> getLastRole() async {
    return null;
  }

  @override
  Future<void> saveRole(IRole role) async {
    _rolesBox ??= await hive.openBox('roles');

    await _rolesBox!.put(
      role.id,
      RoleDTO(item: role, role: role is Group ? Roles.group : Roles.teacher)
          .toJson(),
    );
  }

  @override
  Future<List<Lesson>>? getGroupSchedule(int id) async {
    return [];
  }

  @override
  Future<List<Lesson>> getTeacherSchedule(int id) async {
    return [];
  }

  @override
  Future<void> saveSchedule(List<Lesson> schedule) async {}
}
