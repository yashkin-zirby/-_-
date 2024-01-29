import 'package:laba2/messenger.dart';

class VKMessenger extends Messenger{
  String _messages = "";
  @override
  String get messages => _messages;
  @override
  set messages(value) => _messages = value;
  VKMessenger(String welcomeMessage){
    _messages = welcomeMessage;
  }
  VKMessenger.defaultWelcome(){
    _messages = "Welcome to vk chat";
  }
  @override
  List<String> readChat() {
    return _messages.split('\n');
  }
  @override
  void sendMessage(String username, String message) {
    _messages += "\nvk.com:$username:> $message";
  }

}