import 'package:griffin_phoenix/internal/domain/data_providers/roles/i_roles_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/network/i_core_api.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';

class NetworkRolesDataProvider extends IRolesDataProvider {
  final ICoreApi _coreApi;
  NetworkRolesDataProvider(this._coreApi);

  @override
  Future<ApiDTO?> searchForGroup(int? id, String? name) async {
    assert(id != null || name != null, 'id != null || name != null');

    final String url =
        id != null ? '/groups/search?id=$id' : '/groups/search?name=$name';

    return await _coreApi.getRequest(url);
  }

  @override
  Future<ApiDTO?> searchForTeacher(int? id, String? name) async {
    assert(id != null || name != null, 'id != null || name != null');

    final String url =
        id != null ? '/teachers/search?id=$id' : '/teachers/search?name=$name';

    return await _coreApi.getRequest(url);
  }
}
