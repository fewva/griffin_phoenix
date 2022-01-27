import 'package:griffin_phoenix/internal/constants/constants.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/lessons/lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/roles/i_roles_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/data_providers/roles/role_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/network/core_api.dart';
import 'package:griffin_phoenix/internal/domain/network/i_core_api.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/hive_data_storage_service.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/i_data_storage_service.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/lessons_service.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role/i_select_role_service.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role/select_role_service.dart';
import 'package:griffin_phoenix/root/container/root_container.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart';

Future<RootContainer> initContainer() async {
  final HiveInterface hive = Hive;
  final hivePath =
      await getApplicationDocumentsDirectory().then((value) => value.path);

  final ICoreApi iCoreApi = DioCoreApi(Constants.baseUrl);

  final IRolesDataProvider iRolesDataProvider =
      NetworkRolesDataProvider(iCoreApi);

  final ILessonsDataProvider iLessonsDataProvider =
      NetworkLessonsDataProvider(iCoreApi);

  final IDataStorageService iDataStorageService =
      HiveDataStorageService(path: hivePath, hive: hive);

  final ILessonsService iLessonsService =
      LessonsService(iLessonsDataProvider, iDataStorageService);

  final ISelectRoleService iSelectRoleServlce =
      SelectRoleService(iRolesDataProvider);

  return RootContainer(
    iCoreApi: iCoreApi,
    iDataStorageService: iDataStorageService,
    iRolesDataProvider: iRolesDataProvider,
    iLessonsDataProvider: iLessonsDataProvider,
    iLessonsService: iLessonsService,
    iSelectRoleService: iSelectRoleServlce,
  );
}
