import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget{
  late final ImageProvider? _image;
  late final String _name;
  ImageContainer(ImageProvider? image, {super.key,String name="II"}){
    _image = image;
    _name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:10, top:5, bottom: 5),
      width: 50,
      height: 50,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black12,
          border: Border.all(color: Colors.black,width:2,strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      child: _image != null?
        Image(fit: BoxFit.fitHeight, image: _image as ImageProvider):
        Center(
            child:Text(_name,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 100, 100, 100),
                fontWeight: FontWeight.bold
              ),
            )
        ),
    );
  }

}