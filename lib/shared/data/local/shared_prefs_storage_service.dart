import 'dart:async';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService{
  SharedPreferences? sharedPreferences;
  final Completer<SharedPreferences> initCompleter = Completer<SharedPreferences>();
  @override
  void init(){
    initCompleter.complete(SharedPreferences.getInstance());
  }
  @override
  bool get hasInitialized => sharedPreferences != null;
  @override
  Future<Object?> get(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.get(key);
  }
  @override
  Future<void> clear() async {
    sharedPreferences = await initCompleter.future;
    sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key)async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async{
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(String key, String data) async{
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.setString(key, data.toString());
  }
}