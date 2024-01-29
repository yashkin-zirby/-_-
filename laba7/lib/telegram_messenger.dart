import 'package:laba7/joinable.dart';
import 'package:laba7/messenger.dart';

class TelegramMessenger extends Messenger implements Joinable{
  @override
  final typeName = "Telegram Messenger";
  static int _userCountInAllMessengers = 0;
  int get userCountInAllMessengers => _userCountInAllMessengers;
  List<(int id, String user, String message)> _messages = [];
  @override
  List<(int id, String user, String message)> get messages => _messages;
  @override
  set messages(value) => _messages = value;
  @override
  List<String> readChat() {
    return _messages.map((element){return (element.$1 > 0?"${element.$1})telegram.com:: ${element.$2}:> ${element.$3}": element.$3);}).toList();
  }
  TelegramMessenger(String welcomeMessage){
    _messages = [(0,"",welcomeMessage)];
  }
  TelegramMessenger.defaultWelcome(){
    _messages = [(0,"","Welcome to telegram chat")];
  }
  @override
  void sendMessage(String username, String message) {
    int id = 0;
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+1;
    _messages.add((id,username,message));
  }

  @override
  void join(String username) {
    int id = 0;
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+1;
    _userCountInAllMessengers++;
    _messages.add((id,"","$username join to chat"));
  }

  @override
  void leave(String username) {
    int id = 0;
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+1;
    _userCountInAllMessengers--;
    _messages.add((id,"","$username leave from chat"));
  }

}