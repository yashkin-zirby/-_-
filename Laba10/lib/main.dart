import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laba10/firebase_messaging/chat_page.dart';
import 'package:laba10/firebase_options.dart';
import 'package:laba10/firestore/firestore_page.dart';
import 'auth/login_page.dart';
import 'auth/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/register" : (BuildContext context) => const RegisterPage(),
        "/login" : (BuildContext context) => const LoginPage(),
        "/fire-store" : (BuildContext context) => const FirestorePage(),
        "/chat" : (BuildContext context) => const ChatPage(),
      },
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
      home: const RegisterPage()
    );
  }
}
