import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/models/response.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, dynamic>? query});

  Future<Either<AppException, Response>> post(String endpoint,
      {Map<String, dynamic>? data});
}
