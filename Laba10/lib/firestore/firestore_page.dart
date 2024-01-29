import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laba10/firestore/db_worker.dart';

final _auth = FirebaseAuth.instance;

class FirestorePage extends StatefulWidget{
  const FirestorePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return FirestorePageState();
  }

}
class FirestorePageState extends State<FirestorePage>{
  final TextEditingController _textController = TextEditingController();
  final User? _user = _auth.currentUser;
  String userId = "";
  late List<(String, String, String)> _messages = [];
  FirestorePageState(){
    if(_user != null) {
      userId = _user!.email!;
    } else {
      userId = "not loggined";
    }
    DbWorker.getMessages().then((value) => setMessages(value));
  }
  void setMessages(List<(String, String, String)> messages){
    setState(() {
      _messages = messages;
    });
  }
  void addMessage() async{
    await DbWorker.addMessage(("",userId,_textController.text));
    _textController.text = "";
    var messages = await DbWorker.getMessages();
    setState(() {
      _messages = messages;
    });
  }
  void removeMessave(String id) async{
    await DbWorker.removeMessage(id);
    var messages = await DbWorker.getMessages();
    setState(() {
      _messages = messages;
    });
  }
  void signOut() async{
    await _auth.signOut();
    goToLogin();
  }
  void goToLogin(){
    Navigator.of(context).pushNamed("/login");
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
                const Text("Firebase Store",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold
                  ),
                ),
                Text(userId,
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
                          child: Text("> ${e.$3}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 50,
                          child: CupertinoButton(
                            onPressed: () {
                              removeMessave(e.$1);
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
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                      labelText: "Data",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.indigoAccent,
                    color: Colors.black,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: (){
                        addMessage();
                      },
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        signOut();
                      },
                      child: const Text("Leave account",
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
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/chat");
                      },
                      child: const Text("Open Chat",
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