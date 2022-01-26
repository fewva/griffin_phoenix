class ApiDTO<R, E> {
  final R? response;
  final R? error;

  ApiDTO({this.error, this.response});

  @override
  String toString() => 'ApiDTO(result: $response, error: $error)';
}
