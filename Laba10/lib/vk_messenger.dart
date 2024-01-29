import 'package:laba10/messenger.dart';

class VKMessenger extends Messenger{
  @override
  final typeName = "VK Messenger";
  List<(String id, String user, String message)> _messages = [];
  @override
  List<(String id, String user, String message)> get messages => _messages;
  @override
  set messages(value) => _messages = value;
  VKMessenger(String welcomeMessage){
    _messages = [("0","",welcomeMessage)];
  }
  VKMessenger.defaultWelcome(){
    _messages = [("0","","Welcome to vk chat")];
  }
  @override
  List<String> readChat() {
    return _messages.map((element){return "vk.com:: ${element.$2}:> ${element.$3}";}).toList();
  }
  @override
  void sendMessage(String username, String message) {
    String id = "1";
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+id;
    _messages.add((id,username,message));
  }

}