
mixin Printer{
  void printMessage(String user, String message){
    print("$user:> $message");
  }
  String getUserMessage(String user, String message){
    return "$user:> $message";
  }
}