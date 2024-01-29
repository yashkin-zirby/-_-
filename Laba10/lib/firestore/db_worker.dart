import 'package:cloud_firestore/cloud_firestore.dart';

class DbWorker{
  static final db = FirebaseFirestore.instance;
  static Future<List<(String, String, String)>> getMessages() async{
    var docs = await db.collection("messages").get().then((value) => value.docs);
    List<(String id, String username, String message)> messages = [];
    for(var doc in docs){
      messages.add((doc.id,doc.data()["username"],doc.data()["message"]));
    }
    return messages;
  }
  Future<List<(String, String, String)>> getData() async{
    return await getMessages();
  }
  static Future<void> addMessage((String id, String username, String message) message) async{
    await db.collection("messages").add({
      "username": message.$2,
      "message": message.$3,
    });
  }
  Future<void> postData((String id, String username, String message) message) async{
    return await addMessage(message);
  }
  static Future<void> removeMessage(String id)async{
    await db.collection("messages").doc(id).delete();
  }
  Future<void> deleteData(String id) async{
    await removeMessage(id);
  }
  static Future<void> updateMessage(String id, (String id, String username, String message) message)async{
    await db.collection("messages").doc(id).set({"username": message.$2, "message": message.$3});
  }
}