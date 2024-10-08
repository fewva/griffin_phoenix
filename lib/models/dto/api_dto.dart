import 'dart:convert';

class ApiDTO<R, E> {
  final R? response;
  final E? error;
  final int? status;
  final int? hash;

  ApiDTO({this.error, this.response, this.status, this.hash});

  factory ApiDTO.fromJson(Map<String, dynamic> json) {
    return ApiDTO(
      error: json['error'],
      response: json['response'],
      status: json['status'],
      hash: json['hashCode'],
    );
  }

  @override
  String toString() => 'ApiDTO(result: $response, error: $error)';

  Map<String, dynamic> toMap() {
    return {
      'response': response,
      'error': error,
      'status': status,
      'hash': hash,
    };
  }

  String toJson() => json.encode(toMap());
}
