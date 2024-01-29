import 'package:laba10/joinable.dart';
import 'package:laba10/messenger.dart';

class TelegramMessenger extends Messenger implements Joinable{
  @override
  final typeName = "Telegram Messenger";
  static int _userCountInAllMessengers = 0;
  int get userCountInAllMessengers => _userCountInAllMessengers;
  List<(String id, String user, String message)> _messages = [];
  @override
  List<(String id, String user, String message)> get messages => _messages;
  @override
  set messages(value) => _messages = value;
  @override
  List<String> readChat() {
    return _messages.map((element){return "telegram.com:: ${element.$2}:> ${element.$3}";}).toList();
  }
  TelegramMessenger(String welcomeMessage){
    _messages = [("","",welcomeMessage)];
  }
  TelegramMessenger.defaultWelcome(){
    _messages = [("","","Welcome to telegram chat")];
  }
  @override
  void sendMessage(String username, String message) {
    String id = "1";
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+id;
    _messages.add((id,username,message));
  }

  @override
  void join(String username) {
    String id = "1";
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+id;
    _userCountInAllMessengers++;
    _messages.add((id,"","$username join to chat"));
  }

  @override
  void leave(String username) {
    String id = "1";
    if(_messages.isNotEmpty)id = _messages[_messages.length-1].$1+id;
    _userCountInAllMessengers--;
    _messages.add((id,"","$username leave from chat"));
  }

}