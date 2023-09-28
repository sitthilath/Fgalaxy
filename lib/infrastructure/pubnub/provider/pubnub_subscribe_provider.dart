import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/infrastructure/pubnub/pubnub_subscribe_service.dart';

final pubnubSubscribeProvider = Provider.family<PubNubSubscribeService, String>((ref, channel){
  final PubNubSubscribeService pubnub = PubNubSubscribeService(channel);
  return pubnub;
});