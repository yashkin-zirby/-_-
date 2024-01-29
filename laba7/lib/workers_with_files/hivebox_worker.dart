import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxWorker{
  late final Future<Box<List<String>>> _box;
  HiveBoxWorker(){
    _box = _initBox();
  }
  Future<void> insert(int id, String username, String message) async {
    var box = await _box;
    if(box.containsKey(id))throw Exception("value with that id already exist");
    box.put(id,[username, message]);
  }
  Future<void> update(int id, String username, String message) async {
    var box = await _box;
    if(!box.containsKey(id))throw Exception("value with that id not exist");
    box.put(id,[username, message]);
  }
  Future<void> delete(int id) async {
    var box = await _box;
    if(!box.containsKey(id))throw Exception("value with that id not exist");
    box.delete(id);
  }
  Future<List<(int,String,String)>> get() async {
    var box = await _box;
    List<(int,String,String)> result = [];
    for(int key in box.keys){
      var value = box.get(key);
      if(value != null) result.add((key,value[0],value[1]));
    }
    return result;
  }
  Future<Box<List<String>>> _initBox()async{
    await Hive.initFlutter();
    return await Hive.openBox("messengerBox");
  }
  Future<void> close() async{
    var box = await _box;
    await box.close();
  }
}