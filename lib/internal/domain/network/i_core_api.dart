import 'package:griffin_phoenix/models/dto/api_dto.dart';

abstract class ICoreApi {
  // ignore: unused_field
  final String _baseUrl;

  ICoreApi(this._baseUrl);

  Future<ApiDTO?>? getRequest(String url);
  Future<ApiDTO?>? postRequest(String url, Map body);
}
