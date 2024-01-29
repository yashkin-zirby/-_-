import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'file_worker.dart';

class FileSystemView extends StatefulWidget{
  const FileSystemView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FileSystemViewState();
  }
}
class _FileSystemViewState extends State<FileSystemView>{
  List<String> _messanges = [];
  Directory? _temporaryDirectory;
  Directory? _appSupport;
  Directory? _appDocuments;
  List<Directory>? _appExternalCache;
  Directory? _appExternalStorage;
  Directory? _appLibDir;
  @override
  void initState() {
    initDirectories();
    super.initState();
  }
  final textStyle = const TextStyle(fontSize: 12, color: Colors.black, overflow: TextOverflow.clip);
  void initDirectories()async{
    Directory? temporaryDirectory = await getTemporaryDirectory();
    Directory? appSupport = await getApplicationSupportDirectory();
    Directory? appDocuments = await getApplicationDocumentsDirectory();
    List<Directory>? appExternalCache = await getExternalCacheDirectories();
    Directory? appExternalStorage = await getExternalStorageDirectory();
    Directory? appLibDir;
    try {
      appLibDir = await getLibraryDirectory();
    }catch(e){
      appLibDir = null;
    }
    setState(() {
      _temporaryDirectory = temporaryDirectory;
      _appSupport = appSupport;
      _appDocuments = appDocuments;
      _appExternalCache = appExternalCache;
      _appExternalStorage = appExternalStorage;
      _appLibDir = appLibDir;
    });
  }
  void onGet()async {
    final File file = File('${_temporaryDirectory!.path}/data.txt');
    if(file.existsSync()) {
      final String fileContent = await file.readAsString();
      setState(() {
        _messanges = fileContent.split("\n");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Задание 4"),
        Text("Работа с файлами", style: const TextStyle(fontSize: 24, color: Colors.blueGrey)),
        Container(
          margin: const EdgeInsets.only(left:40, right:40),
          child: Column(
            children: [
              Text("TemporaryDirectory: ${_temporaryDirectory!=null?_temporaryDirectory!.path:"Undefined"}",style: textStyle),
              Text("ApplicationSupportDirectory: ${_appSupport!=null?_appSupport!.path:"Undefined"}",style: textStyle),
              Text("ApplicationDocumentsDirectory: ${_appDocuments!=null?_appDocuments!.path:"Undefined"}",style: textStyle),
              Row(children: [
                Text("ExternalCacheDirectories: ",style: textStyle),
                if (_appExternalCache!=null)Expanded(child: Column(
                    children: _appExternalCache!.map((n){
                      return Text(n.path,style: textStyle);
                    }).toList()
                )) else Text("Undefined",style: textStyle)
              ],
              ),
              Text("ExternalStorageDirectory: ${_appExternalStorage!=null?_appExternalStorage!.path:"Undefined"}",style: textStyle),
              Text("LibraryDirectory: ${_appLibDir!=null?_appLibDir!.path:"Undefined"}",style: textStyle),
            ],
          ),
        ),
        const Text("Data",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 16)),
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
        FileWorker(onGet: onGet,
            onUpdate: (id, user, message)async {
              final File file = File('${_temporaryDirectory!.path}/data.txt');
              if(file.existsSync()) {
                final String fileContent = await file.readAsString();
                var messanges = fileContent.split("\n");
                for (int i = 0; i < messanges.length; i++) {
                  var splited = messanges[i].split(")file::");
                  if (splited[0] == id.toString()) {
                    messanges[i] = "$id)file:: $user:> $message";
                    await file.writeAsString(messanges.join("\n"));
                    onGet();
                    return;
                  }
                }
              }
              setState(() {
                _messanges = ["Нет элемента с таким id"];
              });
            },
            onDelete: (id)async {
              final File file = File('${_temporaryDirectory!.path}/data.txt');
              if(file.existsSync()) {
                final String fileContent = await file.readAsString();
                var messanges = fileContent.split("\n");
                for (int i = 0; i < messanges.length; i++) {
                  var splited = messanges[i].split(")file::");
                  if (splited[0] == id.toString()) {
                    messanges.removeAt(i);
                    await file.writeAsString(messanges.join("\n"));
                    onGet();
                    return;
                  }
                }
              }
              setState(() {
                _messanges = ["Нет элемента с таким id"];
              });
            },
            onCreate: (id, user, message)async {
              final File file = File('${_temporaryDirectory!.path}/data.txt');
              List<String> messanges = [];
              if(file.existsSync()) {
                final String fileContent = await file.readAsString();
                messanges = fileContent.split("\n");
                for (int i = 0; i < messanges.length; i++) {
                  var splited = messanges[i].split(")file::");
                  if (splited[0] == id.toString()) {
                    setState(() {
                      _messanges = ["Элемент с таким id уже существует"];
                    });
                    return;
                  }
                }
              }
              messanges.add("$id)file:: $user:> $message");
              await file.writeAsString(messanges.join("\n"));
              onGet();
            })
      ],
    );
  }

}