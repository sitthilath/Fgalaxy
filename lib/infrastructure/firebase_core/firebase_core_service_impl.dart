import 'package:firebase_core/firebase_core.dart';
import 'package:galaxy_18_lottery_app/infrastructure/firebase_core/firebase_core_service.dart';

class FirebaseCoreServiceImpl implements FirebaseCoreService{
  @override
  Future<FirebaseCoreService> init() async{
    try{
     // await Firebase.initializeApp();
    }catch (e) {
      print('Galaxy 18 [Firebase Initialize]: $e');
    }
    return this;
  }

}