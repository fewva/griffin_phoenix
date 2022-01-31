import 'package:griffin_phoenix/internal/domain/data_providers/lessons/i_lessons_data_provider.dart';
import 'package:griffin_phoenix/internal/domain/services/data_storage/i_data_storage_service.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';

class LocalLessonsDataProvider extends ILessonsDataProvider {
  final IDataStorageService _iDataStorageService;

  LocalLessonsDataProvider(this._iDataStorageService);

  @override
  Future<ApiDTO?> getGroupLessons({required int groupId, int? hash}) async {
    var result;

    try {
      result = await _iDataStorageService.getGroupSchedule(groupId);
      printWarning('result: ${result}');

      return ApiDTO(response: result);
    } catch (e) {
      return ApiDTO(error: e, response: result);
    }
  }

  Future<ApiDTO?> getTeacherLessons({required int teacherId, int? hash}) async {
    return ApiDTO();
  }
}
