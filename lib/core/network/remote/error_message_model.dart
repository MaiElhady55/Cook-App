import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  // final int? statusCode;
  final String statusMessge;
  //final bool success;

  const ErrorMessageModel({
    //required this.statusCode,
    required this.statusMessge,
    // required this.success
  });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      // statusCode: json['status'] as int?,
      statusMessge: json['message'],
      //success: json['success']
    );
  }

  @override
  List<Object?> get props => [
        // statusCode,
        statusMessge,
        // success
      ];
}
