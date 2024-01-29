import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  const ChatPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ChatPageState();
  }
}
class ChatPageState extends State<ChatPage>{
  final TextEditingController _textController = TextEditingController();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  AuthorizationStatus? _status;
  List<String> _messages = [];
  ChatPageState(){
    initFirebase();
  }

  void initFirebase() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        setState(() {
          _messages.add("Notification: ${message.notification!.body}");
        });
      });
    }
    setState(() {
      _status = settings.authorizationStatus;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(15, 50, 0, 0),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Firebase Messaging",
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(_status != null? _status.toString() : "",
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),
                  ),
                ],
              )
              )
          ),
          Expanded(child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(35, 20, 30, 0),
              color: Colors.black12,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _messages.map((e) => Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(e,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            _messages.remove(e);
                          });
                        },
                        child: const Icon(Icons.remove_circle_outline, color: Colors.red,),
                      ),
                    )
                  ],
                )).toList(),
              ),
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(35, 20, 30, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/fire-store");
                      },
                      child: const Text("Open Storage",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}