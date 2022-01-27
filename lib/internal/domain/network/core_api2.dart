import 'package:dio/dio.dart';
import 'package:griffin_phoenix/internal/constants/constants.dart';
import 'package:griffin_phoenix/internal/domain/network/i_core_api.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';

class CoreApi2 implements ICoreApi {
  // ignore: unused_field
  final String _baseUrl;

  CoreApi2(this._baseUrl)
      : _dio = Dio(BaseOptions(baseUrl: _baseUrl, connectTimeout: 20000));

  final Dio _dio;

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

  @override
  Future<ApiDTO> getRequest(String url) async {
    try {
      final DateTime startTime = DateTime.now();
      final Response result = await _dio.get(url);
      final DateTime endTime = DateTime.now();
      printWarning(
        '${Constants.baseUrl}$url (${endTime.difference(startTime).inMilliseconds} ms)',
      );

      return ApiDTO.fromJson(result.data);
    } catch (e) {
      printError('${Constants.baseUrl}/$url');
      printError(e);
      return ApiDTO(error: e);
    }
  }

  @override
  Future<ApiDTO> postRequest(String url, Map body) async {
    try {
      final DateTime startTime = DateTime.now();
      final Response result = await _dio.post(url, data: body);
      final DateTime endTime = DateTime.now();
      printWarning(
        '${Constants.baseUrl}$url (${endTime.difference(startTime).inMilliseconds} ms)',
      );

      return ApiDTO.fromJson(result.data);
    } catch (e) {
      printError('${Constants.baseUrl}/$url');
      printError(e);
      return ApiDTO(error: e);
    }
  }
}
