import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget{
  final Function? _onClick;
  const CircleButton(this._onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){_onClick!();},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: const Text(''),
    );
  }

}