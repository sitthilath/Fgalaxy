import 'package:galaxy_18_lottery_app/infrastructure/pubnub/pubnub_service.dart';
import 'package:pubnub/pubnub.dart';

class PubNubSubscribeService implements PubNubService {
  late PubNub pubNub;

  PubNubSubscribeService(String channel) {
    pubNub = PubNub(
      defaultKeyset: Keyset(
        subscribeKey: 'sub-c-835e2846-b4bc-11ec-8a86-d29fac035801',
        publishKey: 'pub-c-149c513c-f0ae-475e-bce7-586e6134d66f',
        secretKey: 'sec-c-YzY1YjYzNGQtMzY5NC00OGRkLWJjOGItZDIxNTFiNDNlZTkx',
        userId: const UserId("Amanda-device"),
      ),
    );
    print("====>$pubNub");
  }

  Subscription subscribeWithPartner({required String channel, required void Function(Subscription channelSubscription, dynamic message) onMessage}){
    final Subscription channelSubscription = pubNub.subscribe(
      channels: {setChannel(channel)},
    );
    channelSubscription.messages.listen((event) {
      print(" =====>$event");
      if(onMessage != null){
        onMessage(channelSubscription, event.payload);
      }
    });
    return channelSubscription;
  }
  String setChannel(String _channel){
    final String channel = "$_channel";
    return channel;
  }
}
