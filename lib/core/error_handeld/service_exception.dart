import 'package:movies_appp/core/error_handeld/api_error_model.dart';

class ServiceException implements Exception {
  final ErrorMessageModel errorMessageModel ;

  ServiceException({required this.errorMessageModel});

}