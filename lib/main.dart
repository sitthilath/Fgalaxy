import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main/app.dart';
import 'main/app_env.dart';
import 'main/observers.dart';

void main()async => mainCommon(AppEnvironment.PROD);
Future<void>mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  runApp(ProviderScope(observers: [
    Observers(),
  ], child: MyApp()));
}