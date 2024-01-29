import 'package:flutter/material.dart';


class FileWorker extends StatefulWidget{
  final Function? onCreate;
  final Function? onDelete;
  final Function? onUpdate;
  final Function? onGet;
  String errorText = "";
  final TextEditingController controllerId = TextEditingController();
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerMessage = TextEditingController();
  FileWorker({super.key, this.onCreate, this.onDelete, this.onUpdate, this.onGet});
  @override
  State<StatefulWidget> createState() {
    return _FileWorker();
  }
}
class _FileWorker extends State<FileWorker>{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controllerId = widget.controllerId;
    final controllerUser = widget.controllerUser;
    final controllerMessage = widget.controllerMessage;
    String text = widget.errorText;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 60,
              height: 40,
              child: Material(
                  child: TextField(controller: controllerId,
                      decoration: const InputDecoration(hintText: "Id"),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                  )
              )
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: 120,
                height: 40,
                child: Material(
                    child: TextField(controller: controllerUser,
                      decoration: const InputDecoration(hintText: "UserName"),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                    )
                )
            ),
            Container(
              margin: const EdgeInsets.all(10),
                width: 120,
                height: 40,
                child: Material(
                    child: TextField(controller: controllerMessage,
                      decoration: const InputDecoration(hintText: "Message"),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                    )
                )
            ),
          ],
        ),
        if (text.isNotEmpty) Text(text, style: const TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){widget.onGet!();},
                child: Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    color: Colors.deepPurpleAccent,
                    child: const Text("Get", style: TextStyle(color: Colors.black),)
                )
            ),
            TextButton(onPressed: (){
                int? id = int.tryParse(controllerId.text);
                String user = controllerUser.text;
                String message = controllerMessage.text;
                if(id != null && user.isNotEmpty && message.isNotEmpty) {
                  widget.onCreate!(id, user, message);
                  setState(() {
                    widget.errorText = "";
                    widget.controllerMessage.text = "";
                    widget.controllerId.text = "";
                    widget.controllerUser.text = "";
                  });
                }else{
                  setState(() {
                    if(id == null)widget.errorText = "id должно быть числом";
                    else widget.errorText = "Введите данные для добавления";
                  });
                }
              },
                child: Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    color: Colors.deepPurpleAccent,
                    child: const Text("Insert", style: TextStyle(color: Colors.black),)
                )
            ),
            TextButton(onPressed: (){
                int? id = int.tryParse(controllerId.text);
                String user = controllerUser.text;
                String message = controllerMessage.text;
                if(id != null && user.isNotEmpty && message.isNotEmpty) {
                  widget.onUpdate!(id, user, message);
                  setState(() {
                    widget.errorText = "";
                    widget.controllerMessage.text = "";
                    widget.controllerId.text = "";
                    widget.controllerUser.text = "";
                  });
                }else{
                  setState(() {
                    if(id == null)widget.errorText = "id должно быть числом";
                    else widget.errorText = "Введите данные для добавления";
                  });
                }
              },
                child: Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    color: Colors.deepPurpleAccent,
                    child: const Text("Update", style: TextStyle(color: Colors.black),)
                )
            ),
            TextButton(onPressed: (){
                int? id = int.tryParse(controllerId.text);
                if(id != null) {
                  widget.onDelete!(id);
                  setState(() {
                    widget.errorText = "";
                    widget.controllerMessage.text = "";
                    widget.controllerId.text = "";
                    widget.controllerUser.text = "";
                  });
                }else{
                  setState(() {
                    if(id == null)widget.errorText = "id должно быть числом";
                    else widget.errorText = "Введите id";
                  });
                }
              },
                child: Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    color: Colors.deepPurpleAccent,
                    child: const Text("Delete", style: TextStyle(color: Colors.black),)
                )
            ),
          ],
        )
      ],
    );
  }

}