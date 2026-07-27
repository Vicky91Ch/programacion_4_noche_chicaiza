// lib/models/api_error_mp.dart
class ApiError {
  final int    statusCode;
  final String mensaje;
  final List<String> detalles;

  const ApiError({
    required this.statusCode,
    required this.mensaje,
    this.detalles = const [],
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['statusCode'] as int? ?? 500,
      mensaje:    json['mensaje']    as String? ?? 'Error desconocido',
      detalles:   (json['detalles'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }
}
