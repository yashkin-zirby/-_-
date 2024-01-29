abstract class Messenger{
  void sendMessage(String username, String message);
  String readChat();
  List<String> get messages;
  set messages(List<String> value);
  static List<String> getAllUsersLike(Messenger messenger, [Pattern pattern = ""]){
    var usersLikePattern = <String>[];
    for(var message in messenger.messages){
      var splited = message.split(":> ");
      if(splited.length < 2)continue;
      var username = splited[splited.length-2].substring(splited[splited.length - 2].lastIndexOf(":")+1);
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
  static List<(String username, String message)> exportMessanges(Messenger messenger){
    List<(String username, String message)> usersWithMessanges = [];
    for(int i = 0; i < messenger.messages.length; i++){
      var splited = messenger.messages[i].split(":> ");
      if(splited.length > 1) {
        var message = splited[splited.length - 1];
        var username = splited[splited.length - 2].substring(splited[splited.length - 2].lastIndexOf(":")+1);
        usersWithMessanges.add((username,message));
      }
    }
    return usersWithMessanges;
  }
  static void importMessanges(Messenger messenger, List<(String username, String message)> data){
    messenger.messages.clear();
    for(int i = 0; i < data.length; i++){
      messenger.sendMessage(data[i].$1,data[i].$2);
    }
  }
}