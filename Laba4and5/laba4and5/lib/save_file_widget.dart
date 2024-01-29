import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveFileWidget extends StatelessWidget{
  late final Color _color;
  late final String _filename;
  late final String _fileSize;
  late final bool _download;
  SaveFileWidget(String filename, String fileSize, {super.key, bool download = false, Color color=const Color.fromARGB(255, 255, 255, 255)}){
    _filename = filename;
    _fileSize = fileSize;
    _download = download;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: _color
        ),
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 250, 250),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: const Icon(Icons.file_open, size: 30, color: Colors.grey,),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_filename,
                      style: const TextStyle(
                        fontSize: 20,
                      )
                    ),
                    Text(_fileSize,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        )
                    ),
                  ]
                )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 250, 250),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: _download?const CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.deepPurple,
              ): const Icon(Icons.download, size: 30, color: Colors.grey,),
            )
          ],
        ),
      )
    );
  }

}