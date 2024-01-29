import 'package:flutter/material.dart';
import 'package:laba4and5/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laba4-5',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 240),
        primarySwatch: Colors.blue,
      ),
      home: FirstPage()
    );
  }
}
