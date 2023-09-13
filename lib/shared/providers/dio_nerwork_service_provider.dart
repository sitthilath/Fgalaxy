import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../remote/remote.dart';

final networkServiceProvider = Provider<DioNetworkService>((res){
  final Dio dio = Dio();
  return DioNetworkService(dio);
});