abstract class Messenger{
  void sendMessage(String username, String message);
  String get typeName;
  List<String> readChat();
  List<(int id, String user, String message)> get messages;
  set messages(List<(int id, String user, String message)> value);
  static List<String> getAllUsersLike(Messenger messenger, [Pattern pattern = ""]){
    var messages = messenger.messages;
    var usersLikePattern = <String>[];
    for(var message in messages){
      var username = message.$2;
      if(username.contains(pattern))usersLikePattern.add(username);
    }
    return usersLikePattern;
  }
  static List<String> filterMessages(List<String> messages,bool Function(String str) filter){
    var result = <String>[];
    for(String message in messages){
      if(!filter(message))result.add(message);
    }
    return result;
  }
  static List<(int id, String username, String message)> exportMessanges(Messenger messenger){
    return messenger.messages;
  }
  static void importMessanges(Messenger messenger, List<(int id, String username, String message)> data){
    messenger.messages = data;
  }
}