import 'package:laba7/messenger.dart';

class VKMessenger extends Messenger{
  @override
  final typeName = "VK Messenger";
  List<(int id, String user, String message)> _messages = [];
  @override
  List<(int id, String user, String message)> get messages => _messages;
  @override
  set messages(value) => _messages = value;
  VKMessenger(String welcomeMessage){
    _messages = [(0,"",welcomeMessage)];
  }
  VKMessenger.defaultWelcome(){
    _messages = [(0,"","Welcome to vk chat")];
  }
  @override
  List<String> readChat() {
    return _messages.map((element){return (element.$1 > 0?"${element.$1})vk.com:: ${element.$2}:> ${element.$3}": element.$3);}).toList();
  }
  @override
  void sendMessage(String username, String message) {
    int id = 0;
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+1;
    _messages.add((id,username,message));
  }

}