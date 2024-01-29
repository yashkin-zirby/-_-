import 'dart:math';

import 'package:flutter/cupertino.dart';
enum DayOfWeek{
  monday, tuesday, wednesday, thursday, friday, saturday, sunday,
}
class DayOfWeekButton extends StatelessWidget{
  void Function()? _action;
  static Random rand = Random();
  int _day = 1;
  String _dayOfWeek = "Mon";
  List<Widget> _circles = [];
  Color _color = CupertinoColors.lightBackgroundGray;
  Color _textColor = CupertinoColors.black;
  DayOfWeekButton(int day, DayOfWeek dayOfWeek,{super.key, void Function()? action, Color color = CupertinoColors.lightBackgroundGray}){
    _action = action;
    _color = color;
    if((color.red*0.299 + color.green*0.587 + color.blue*0.114) > 186){
      _textColor = CupertinoColors.black;
    }else{
      _textColor = CupertinoColors.white;
    }
    _day = (day+30)%31+1;
    switch(dayOfWeek){
      case DayOfWeek.monday: _dayOfWeek = "Mon"; break;
      case DayOfWeek.tuesday: _dayOfWeek = "Tue"; break;
      case DayOfWeek.wednesday: _dayOfWeek = "Wed"; break;
      case DayOfWeek.thursday: _dayOfWeek = "Thu"; break;
      case DayOfWeek.friday: _dayOfWeek = "Fri"; break;
      case DayOfWeek.saturday: _dayOfWeek = "Sat"; break;
      case DayOfWeek.sunday: _dayOfWeek = "Sun"; break;
    }
    for(int i = 0; i < _day%3+1; i++){
      _circles.add(
          createCircle(
              Color.fromARGB(
                  255,
                  rand.nextInt(256),
                  rand.nextInt(256),
                  rand.nextInt(256)
              )
          )
      );
    }
  }
  Widget createCircle(Color circleColor){
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: _color,
        padding: const EdgeInsets.all(20),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onPressed: _action,
        child: Container(
          width: 40,
          child: Column(
            children: [
              Text(_day.toString(),
                style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              Text(_dayOfWeek,
                style: TextStyle(
                    color: _textColor,
                    fontSize: 16
                ),
              ),
              SizedBox(
                width: 30,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _circles,
                ),
              )
            ],
          ),
        )
    );
  }
}