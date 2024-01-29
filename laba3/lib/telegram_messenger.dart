import 'package:laba3/joinable.dart';
import 'package:laba3/messenger.dart';
import 'package:laba3/printer.dart';
import 'dart:convert';

class TelegramMessenger extends Messenger with Printer implements Joinable{
  static int _userCountInAllMessengers = 0;
  int get userCountInAllMessengers => _userCountInAllMessengers;
  List<String> _messages = [];
  @override
  List<String> get messages => _messages;
  @override
  set messages(value) => _messages = value;
  @override
  String readChat() {
    return _messages.join('\n');
  }
  String toJSON(){
    return jsonEncode({"messages":_messages});
  }
  static TelegramMessenger fromJSON(String json){
    TelegramMessenger telegramMessenger = TelegramMessenger("");
    telegramMessenger._messages = jsonDecode(json)["messages"].cast<String>();
    return telegramMessenger;
  }
  TelegramMessenger(String welcomeMessage){
    _messages = [welcomeMessage];
  }
  TelegramMessenger.defaultWelcome(){
    _messages = ["Welcome to telegram chat"];
  }
  @override
  void sendMessage(String username, String message) {
    _messages.add("telegram.com:$username:> $message");
  }
  void sendAfter(String username, String message, int milliseconds) async{
    return Future.delayed(Duration(seconds: milliseconds~/1000, milliseconds: milliseconds%1000), ()=>sendMessage(username, message));
  }
  @override
  void join(String username) {
    _userCountInAllMessengers++;
    _messages.add("telegram.com:$username join to chat");
    print("telegram.com:$username join to chat\n");
  }

  @override
  void leave(String username) {
    _userCountInAllMessengers--;
    _messages.add("telegram.com:$username leave from chat");
    print("telegram.com:$username leave from chat\n");
  }

}