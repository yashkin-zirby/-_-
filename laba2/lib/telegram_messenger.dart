import 'package:laba2/joinable.dart';
import 'package:laba2/messenger.dart';

class TelegramMessenger extends Messenger implements Joinable{
  static int _userCountInAllMessengers = 0;
  int get userCountInAllMessengers => _userCountInAllMessengers;
  String _messages = "";
  @override
  String get messages => _messages;
  @override
  set messages(value) => _messages = value;
  @override
  List<String> readChat() {
    return _messages.split('\n');
  }
  TelegramMessenger(String welcomeMessage){
    _messages = welcomeMessage;
  }
  TelegramMessenger.defaultWelcome(){
    _messages = "Welcome to telegram chat";
  }
  @override
  void sendMessage(String username, String message) {
    _messages += "\ntelegram.com:$username:> $message";
  }

  @override
  void join(String username) {
    _userCountInAllMessengers++;
    _messages += "\ntelegram.com:$username join to chat";
    print("\ntelegram.com:$username join to chat");
  }

  @override
  void leave(String username) {
    _userCountInAllMessengers--;
    _messages += "\ntelegram.com:$username leave from chat";
    print("\ntelegram.com:$username leave from chat");
  }

}