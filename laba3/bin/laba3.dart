import 'package:laba3/messenger.dart';
import 'package:laba3/vk_messenger.dart';
import 'package:laba3/telegram_messenger.dart';
Stream<String> ReadMessangerStream(Messenger messenger) async*{
  for(String message in messenger.messages.toList()){
    await Future.delayed(Duration(milliseconds: 250));
    yield message;
  }
}
void main(List<String> arguments) {
  TelegramMessenger telegram = TelegramMessenger("-----------telegram-----------");
  telegram.sendMessage("Ya", "hello");
  telegram.sendMessage("NeYa", "hello");
  telegram.sendMessage("Ya", "I'm The Storm");
  telegram.sendMessage("NeYa", "...");
  print(telegram.readChat());
  var json = telegram.toJSON();
  print(json);
  telegram = TelegramMessenger.fromJSON(json);
  print(telegram.readChat());
  telegram.sendAfter("Ya","Pishu...",1000);
  telegram.sendMessage("NeYa", "why you so long write?");
  Future.delayed(Duration(seconds: 1)).whenComplete((){
    print(telegram.readChat());
    var stream = ReadMessangerStream(telegram);
    var broadcastStream = ReadMessangerStream(telegram).asBroadcastStream(
        onCancel: (controller){
          print('Broadcast Stream is paused');
          controller.pause();
        },
        onListen: (controller){
          if(controller.isPaused){
            print('Broadcast Stream is resumed');
            controller.resume();
          }
        }
    );
    print("Single subscribe stream start");
    stream.listen((event)=>print("Single subscribe stream read: $event"),
        onError: (error)=>print("Error while reading: $error"),
        onDone: (){
        print("Single subscribe stream Done.");
        print("Broadcast subscribe stream start");
        broadcastStream.firstWhere((element) => element.contains("NeYa"))
            .then((value) => print("BroadCast firstWhere:$value"));
        broadcastStream.first.then((value) => print("BroadCast first:$value"));
        broadcastStream.last.then((value) => print("BroadCast last:$value"));
        broadcastStream.isEmpty.then((value) => print("BroadCast isEmpty:$value"));
        broadcastStream.forEach((element)=>print("Broadcast Stream print: $element"));
    });
  });
}
