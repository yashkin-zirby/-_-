import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget{
  final TextEditingController _controller;
  const ErrorMessage(this._controller,{super.key});
  @override
  Widget build(BuildContext context) {
      return Scaffold(
              backgroundColor: Colors.lightGreenAccent,
              body: Align(
                alignment: Alignment.center,
                child: TextField(controller: _controller, enabled: false,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration.collapsed(
                      hintText: "",
                      border: InputBorder.none,
                    ),
                    maxLines: 5,
                    style: const TextStyle(
                      backgroundColor: Colors.lightGreenAccent,
                      color: Colors.red,
                    )
                ),
              )
      );
  }
}