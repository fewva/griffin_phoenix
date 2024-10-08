import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/network/i_core_api.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';

class RemoteLessonsDataProvider implements ILessonsDataProvider {
  final ICoreApi _coreApi;
  RemoteLessonsDataProvider(this._coreApi);

  @override
  Future<ApiDTO?> getGroupLessons({required int groupId, int? hash}) async {
    final String url = hash != null
        ? '/lessons?groupId=$groupId&hashCode=$hash'
        : '/lessons?groupId=$groupId';

    return await _coreApi.getRequest(url);
  }

  @override
  Future<ApiDTO?> getTeacherLessons({required int teacherId, int? hash}) async {
    final String url = hash != null
        ? '/lessons?teacherId=$teacherId&hashCode=$hash'
        : '/lessons?teacherId=$teacherId';

    return await _coreApi.getRequest(url);
  }
}
