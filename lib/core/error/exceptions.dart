//import 'package:cook_app/core/network/remote/error_message_model.dart';

import 'package:cook_app/core/network/remote/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}
