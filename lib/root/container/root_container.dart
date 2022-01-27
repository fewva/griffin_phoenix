import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/roles/i_roles_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/network/i_core_api.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/i_data_storage_service.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role/i_select_role_service.dart';

class RootContainer {
  final ICoreApi iCoreApi;
  final IRolesDataProvider iRolesDataProvider;
  final ILessonsDataProvider iLessonsDataProvider;

  final IDataStorageService iDataStorageService;
  final ISelectRoleService iSelectRoleService;
  final ILessonsService iLessonsService;

  RootContainer({
    required this.iCoreApi,
    required this.iLessonsDataProvider,
    required this.iRolesDataProvider,
    required this.iDataStorageService,
    required this.iLessonsService,
    required this.iSelectRoleService,
  });
}
