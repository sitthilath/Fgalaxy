import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/response.dart';

class AppException implements Exception {
  final String? message;
  final int? statusCode;
  final String? identifier;

  AppException({required this.message, required this.statusCode, required this.identifier});


  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String? get identifier => 'Cache failure exception';

  @override
  String? get message => 'Unable to save user';

  @override
  int? get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

class InitialException extends Equatable implements AppException{
  @override
  String? get identifier => '';

  @override
  String? get message => '';

  @override
  List<Object?> get props => [message, statusCode, identifier];

  @override
  int? get statusCode => 0;

}

//  extension
extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
