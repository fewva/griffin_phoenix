import 'package:dio/dio.dart';
import 'package:griffin_phoenix/internal/domain/network/i_core_api.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/dto/api_dto.dart';

class DioCoreApi implements ICoreApi {
  // ignore: unused_field
  final String _baseUrl;
  // ignore: unused_field
  final Dio _dio;

  DioCoreApi(this._baseUrl)
      : _dio = Dio(BaseOptions(baseUrl: _baseUrl, connectTimeout: 20000));

  @override
  Future<ApiDTO?> getRequest(String url) async {
    try {
      final DateTime startTime = DateTime.now();
      final Response result = await _dio.get(url);
      final DateTime endTime = DateTime.now();
      printWarning(
        '$_baseUrl$url (${endTime.difference(startTime).inMilliseconds} ms)',
      );

      return ApiDTO.fromJson(result.data);
    } catch (e) {
      printError('$_baseUrl/$url');
      printError(e);
      return ApiDTO(error: e);
    }
  }

  @override
  Future<ApiDTO?> postRequest(String url, Map body) async {
    final DateTime startTime = DateTime.now();
    final Response result = await _dio.post(url, data: body);
    final DateTime endTime = DateTime.now();

    printWarning(
      '$_baseUrl$url (${endTime.difference(startTime).inMilliseconds} ms)',
    );

    return ApiDTO.fromJson(result.data);
  }
}
