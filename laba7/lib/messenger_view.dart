import 'package:flutter/material.dart';
import 'messenger.dart';
import 'file_worker.dart';

class MessengerView extends StatefulWidget{
  final Messenger messenger;
  final String title;
  final Function? onCreate;
  final Function? onDelete;
  final Function? onUpdate;
  final Function? onGet;
  const MessengerView(this.title, this.messenger, {super.key, this.onCreate, this.onDelete, this.onUpdate, this.onGet});
  @override
  State<StatefulWidget> createState() {
    return _MessengerViewState();
  }
}
class _MessengerViewState extends State<MessengerView>{
  late List<String> _messanges = widget.messenger.readChat();
  late final String _typeName = widget.messenger.typeName;
  late final String title;
  @override
  void initState() {
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(_typeName, style: const TextStyle(fontSize: 24, color: Colors.blueGrey)),
        Container(
          margin: const EdgeInsets.only(left:40, right:40),
          child: Column(
            children: _messanges.map(
                    (e) => Text(e,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    )
            ).toList(),
          ),
        ),
        FileWorker(onGet: ()async {
              var list = await widget.onGet!();
              setState(() {
                widget.messenger.messages = list;
                _messanges = widget.messenger.readChat();
              });
            },
            onUpdate: (id, user, message)async {
              await widget.onUpdate!(id, user, message);
              setState(() {
                _messanges = widget.messenger.readChat();
              });
            },
            onDelete: (id)async {
              await widget.onDelete!(id);
              setState(() {
                _messanges = widget.messenger.readChat();
              });
            },
            onCreate: (id, user, message)async {
              await widget.onCreate!(id, user, message);
              setState(() {
                _messanges = widget.messenger.readChat();
              });
            })
      ],
    );
  }

}