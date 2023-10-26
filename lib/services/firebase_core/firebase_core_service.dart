import 'package:firebase_core/firebase_core.dart';

class FirebaseCoreService {
  Future<FirebaseCoreService> init() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      throw "Galaxy18 Lottery [Firebase initialization]: $e";
    }
    return this;
  }
}
