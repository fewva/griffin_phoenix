import 'package:dio/dio.dart';
import 'package:griffin_phoenix/internal/constants/constants.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/api_dto.dart';

class CoreApi {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: Constants.baseUrl, connectTimeout: 20000),
  );

  String getGroupsUrl({int? id, String? name}) {
    const base = '/groups/search?';
    if (id != null) return '${base}id=$id';
    if (name != null) return '${base}name=$name';
    return base;
  }

  String getTeachersUrl({int? id, String? name}) {
    const base = '/teachers/search?';
    if (id != null) return '${base}id=$id';
    if (name != null) return '${base}name=$name';
    return base;
  }

  String getLessonsUrl({int? groupId, int? teacherId}) {
    const base = '/lessons?';
    if (groupId != null) return '${base}groupId=$groupId';
    if (teacherId != null) return '${base}teacherId=$teacherId';
    return base;
  }

  Future<ApiDTO> getRequest(String url) async {
    try {
      final DateTime startTime = DateTime.now();
      final Response result = await _dio.get(url);
      final DateTime endTime = DateTime.now();
      printWarning(
        '${Constants.baseUrl}$url (${endTime.difference(startTime).inMilliseconds} ms)',
      );

      return ApiDTO(response: result.data);
    } catch (e) {
      printError('${Constants.baseUrl}/$url');
      printError(e);
      return ApiDTO(error: e);
    }
  }
}
