import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main/app.dart';
import 'main/app_env.dart';
import 'main/observers.dart';

void main()async => mainCommon(AppEnvironment.PROD);
Future<void>mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  await Firebase.initializeApp();
  runApp(ProviderScope(observers: [
    Observers(),
  ], child: const MyApp()));
}