import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver{
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container){
    if (kDebugMode) {
      print('''{"provider": "${provider.name ?? provider.runtimeType}","newValue": "disposed"}''' as dynamic);
    }
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    if (kDebugMode) {
      print('''{"provider": "${provider.name ?? provider.runtimeType}","newValue": "disposed"}''' as dynamic);
    }
    super.didDisposeProvider(provider, container);
  }
}