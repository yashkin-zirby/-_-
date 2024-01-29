import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefWorker{
  late final Future<SharedPreferences> _prefs;
  SharedPrefWorker(){
    _prefs = SharedPreferences.getInstance();
  }
  Future<void> insert(int id, String username, String message) async {
    final SharedPreferences pref = await _prefs;
    pref.setStringList(id.toString(), [username,message]);
  }
  Future<void> update(int id, String username, String message) async {
    final SharedPreferences pref = await _prefs;
    pref.setStringList(id.toString(), [username,message]);
  }
  Future<void> delete(int id) async {
    final SharedPreferences pref = await _prefs;
    pref.remove(id.toString());
  }
  Future<List<(int,String,String)>> get() async {
    final SharedPreferences pref = await _prefs;
    var keys = pref.getKeys();
    List<(int,String,String)> result = [];
    for(String key in keys){
      var values = pref.getStringList(key);
      if(values != null)result.add((int.parse(key),values[0],values[1]));
    }
    return result;
  }
}