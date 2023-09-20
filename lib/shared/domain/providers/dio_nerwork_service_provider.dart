import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/remote.dart';

final networkServiceProvider = Provider<DioNetworkService>((res){
  final Dio dio = Dio();
  return DioNetworkService(dio);
});