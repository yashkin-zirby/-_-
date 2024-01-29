import 'package:laba2/messenger.dart';
import 'package:laba2/telegram_messenger.dart';
import 'package:laba2/vk_messenger.dart';

void main(List<String> arguments) {
  TelegramMessenger telegram = TelegramMessenger.defaultWelcome();
  VKMessenger vk = VKMessenger("VK.com messenger welcome you.");
  telegram.join("Stanislav");
  telegram.sendMessage("Stanislav", "Hello!");
  telegram.sendMessage("Stanislav", "Anyone has here?");
  telegram.leave("Stanislav");
  print('Telegram messenger: \n${telegram.messages}');
  vk.sendMessage("Unknown", "message");
  vk.sendMessage("Unknown", "message2");
  vk.sendMessage("Me", "what? nightmare?");
  print('Vk messenger: \n${vk.messages}');
  var exportData = Messenger.exportMessanges(vk);
  Messenger.importMessanges(telegram, exportData);
  print("Now telegram has next messages:");
  var messages = telegram.readChat();
  for(int i = 0; i < messages.length; i++){
    print("    ${messages[i]}");
  }
  var list = [for(int i = 0; i < 8; i++)i];
  list.add(0);
  print("list with duplicate value: $list");
  var set = {0,1,2,3,4,5,6,7};
  set.add(2);
  print("set with duplicate value: $set");
  var map = { 1:"zero",2:"one",3:"two"};
  map[2] = "two";
  print("map with change value by key: $map");
  var filtered = Messenger.filterMessages(messages, (str) => str.toLowerCase().contains(RegExp(":>.*nig")));
  for(var message in messages){
    if(!filtered.contains(message)){
      print("$message - filtered");
      continue;
    }
    print(message);
  }
  print("first not unknown user:");
  for(var user in Messenger.getAllUsersLike(telegram)){
     if(user != "Unknown"){
       print("    $user");
       break;
     }
  }
  try{
    int sum(int a,int b){
      return a+b;
    }
    int product(int a,int b){
      return a*b;
    }
    int Function(int,int) operation = sum;
    var numbers = [1,2,3,4,5];
    for(int i = 0; i < numbers.length; i++){
      print(operation(numbers[i],numbers[i+1]));
      if(i % 2 == 0){
        operation = product;
      }
      else{
        operation = sum;
      }
    }
  } on RangeError catch(e){
    print("Error: ${e.message} (${e.invalidValue} не принадлижит промежутку [${e.start},${e.end}])");
  }
}
