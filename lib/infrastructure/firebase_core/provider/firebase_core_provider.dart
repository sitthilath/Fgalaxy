import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/infrastructure/firebase_core/firebase_core_service.dart';
import 'package:galaxy_18_lottery_app/infrastructure/firebase_core/firebase_core_service_impl.dart';

final firebaseCoreProvider = Provider<FirebaseCoreService>((ref){
  final firebaseCoreService = FirebaseCoreServiceImpl();
  return firebaseCoreService;
});