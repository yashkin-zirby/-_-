import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laba7/filesystem_view.dart';
import 'package:laba7/workers_with_files/db_worker.dart';
import 'package:laba7/error_message.dart';
import 'package:laba7/messenger_view.dart';
import 'package:laba7/telegram_messenger.dart';
import 'package:laba7/vk_messenger.dart';
import 'package:laba7/workers_with_files/hivebox_worker.dart';
import 'package:laba7/workers_with_files/shared_pref_worker.dart';
import 'circle_button.dart';

final HiveBoxWorker box = HiveBoxWorker();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void showError(TextEditingController controller, String error) async{
    controller.text = error;
    await Future.delayed(const Duration(seconds: 2));
    controller.text = "";
  }
  @override
  Widget build(BuildContext context) {
    final errorController = TextEditingController();
    final PageController controller = PageController(initialPage: 0);
    final DBWorker db = DBWorker();
    final SharedPrefWorker pref = SharedPrefWorker();
    final zadanie1 = VKMessenger("Hello");
    final zadanie2 = TelegramMessenger.defaultWelcome();
    final zadanie3 = VKMessenger("NONE");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          ErrorMessage(errorController),
          Container(
            color: Colors.transparent,
            child: PageView(
              controller: controller,
              children: [
                MessengerView("Задание 1", zadanie1,
                  onCreate: (id, user, message) async{
                    try {
                      await db.insert(id, user, message);
                      zadanie1.messages.add((id,user,message));
                    }catch(e){
                      showError(errorController,"Запись с таким id уже существует");
                    }
                  },
                  onGet: ()async{
                      return await db.get();
                  },
                  onDelete: (id)async{
                    try {
                      await db.delete(id);
                      int i = zadanie1.messages.indexWhere((el) => el.$1 == id);
                      zadanie1.messages.removeAt(i);
                    }catch(e){
                      showError(errorController,"Записи с таким id не существует");
                    }
                  },
                  onUpdate: (id, user, message)async{
                    try {
                      await db.update(id, user, message);
                      int i = zadanie1.messages.indexWhere((el) => el.$1 == id);
                      zadanie1.messages[i] = (id, user, message);
                    }catch(e){
                      showError(errorController,"Запись с таким id не существует");
                    }
                  },
                ),
                MessengerView("Задание 2", zadanie2,
                  onCreate: (id, user, message)async{
                    await pref.insert(id, user, message);
                    zadanie2.messages.add((id,user,message));
                  },
                  onGet: ()async{
                    return await pref.get();
                  },
                  onDelete: (id)async{
                    await pref.delete(id);
                    int i = zadanie2.messages.indexWhere((el) => el.$1 == id);
                    zadanie2.messages.removeAt(i);
                  },
                  onUpdate: (id, user, message)async{
                    await pref.update(id, user, message);
                    int i = zadanie2.messages.indexWhere((el) => el.$1 == id);
                    zadanie2.messages[i] = (id, user, message);
                  },
                ),
                MessengerView("Задание 3", zadanie3,
                  onCreate: (id, user, message) async{
                    try {
                      await box.insert(id, user, message);
                      zadanie3.messages.add((id,user,message));
                    }catch(e){
                      showError(errorController,"Запись с таким id уже существует");
                    }
                  },
                  onGet: ()async{
                    return await box.get();
                  },
                  onDelete: (id)async{
                    try {
                      await box.delete(id);
                      int i = zadanie3.messages.indexWhere((el) => el.$1 == id);
                      zadanie3.messages.removeAt(i);
                    }catch(e){
                      showError(errorController,"Записи с таким id не существует");
                    }
                  },
                  onUpdate: (id, user, message)async{
                    try {
                      await box.update(id, user, message);
                      int i = zadanie3.messages.indexWhere((el) => el.$1 == id);
                      zadanie3.messages[i] = (id, user, message);
                    }catch(e){
                      showError(errorController,"Запись с таким id не существует");
                    }
                  },
                ),
                const FileSystemView()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(() {
                  controller.jumpToPage(0);
                }),
                CircleButton(() {
                  controller.jumpToPage(1);
                }),
                CircleButton(() {
                  controller.jumpToPage(2);
                }),
                CircleButton(() {
                  controller.jumpToPage(3);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
