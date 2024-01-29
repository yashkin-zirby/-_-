import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laba4and5/day_of_week_button.dart';
import 'package:laba4and5/save_file_widget.dart';

import 'image_container.dart';

class SecondPage extends StatelessWidget{
  late final _text;
  SecondPage(String text, {super.key}){_text = text;}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("June, 17",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        const Text("Monday",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey
                          ),
                        ),
                        Row(
                          children: [
                            CupertinoButton(onPressed: (){},
                                padding: EdgeInsets.zero,
                                color: const Color.fromARGB(255, 250, 250, 250),
                                child: const Icon(Icons.chevron_left,
                                    size: 40,
                                    color: Color.fromARGB(255, 120, 120, 120)
                                )
                            ),
                            CupertinoButton(onPressed: (){},
                                padding: EdgeInsets.zero,
                                color: const Color.fromARGB(255, 250, 250, 250),
                                child: const Icon(Icons.chevron_right,
                                    size: 40,
                                    color: Color.fromARGB(255, 120, 120, 120)
                                )
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DayOfWeekButton(1,DayOfWeek.monday,
                              action: (){},
                              color: Colors.deepPurpleAccent
                          ),
                          const SizedBox(width: 20,),
                          DayOfWeekButton(2,DayOfWeek.tuesday,
                              action: (){}
                          ),
                          const SizedBox(width: 20,),
                          DayOfWeekButton(3,DayOfWeek.wednesday,
                              action: (){}
                          ),
                          const SizedBox(width: 20,),
                          DayOfWeekButton(4,DayOfWeek.thursday,
                              action: (){}
                          ),
                          const SizedBox(width: 20,),
                          DayOfWeekButton(5,DayOfWeek.friday,
                              action: (){}
                          ),const SizedBox(width: 20,),
                          DayOfWeekButton(6,DayOfWeek.saturday,
                              action: (){}
                          ),
                          const SizedBox(width: 20,),
                          DayOfWeekButton(7,DayOfWeek.sunday,
                              action: (){}
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      children: const [
                        Text("Members", style: TextStyle(fontSize: 24),),
                        Text("8", style: TextStyle(
                            fontSize: 12,
                            height: -0.5,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Wrap(
                      children: [
                        ImageContainer(const NetworkImage("https://avatars.mds.yandex.net/i?id=e23d7067f0b7540776bfd3bde739e2b37d01ad5c-9049620-images-thumbs&n=13")),
                        ImageContainer(const NetworkImage("https://profile-images.xing.com/images/d701ddcc646b24f1137828b1e8657189-5/alexander-sukram.1024x1024.jpg")),
                        ImageContainer(null,name: "JR"),
                        ImageContainer(null,name: "JJ"),
                        ImageContainer(const NetworkImage("https://fikiwiki.com/uploads/posts/2022-02/1644924492_40-fikiwiki-com-p-kartinki-uspeshnikh-lyudei-41.jpg")),
                        ImageContainer(null,name: "MP"),
                        ImageContainer(const NetworkImage("https://c.pxhere.com/photos/b1/dd/beautiful_beauty_blurred_background_cars_city_close_up_daylight_daytime-1563287.jpg!d")),
                        ImageContainer(const NetworkImage("https://avatars.mds.yandex.net/i?id=9e39266d0ed815a9a3093b3c6b7f2c57657647c7-10927571-images-thumbs&n=13")),
                        Container(
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
                          child: IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                        )
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      children: const [
                        Text("Files", style: TextStyle(fontSize: 24),),
                        Text("11", style: TextStyle(
                            fontSize: 12,
                            height: -0.5,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child:Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: double.maxFinite,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SaveFileWidget(_text,"43,1 MB",
                              color: const Color.fromARGB(255, 240, 240, 240),
                              download: true,
                            ),
                            SaveFileWidget("Guigebood-info.doc","415,6 KB"),
                            SaveFileWidget("message.txt","32,1 KB"),
                            SaveFileWidget("Logotype-Ice.ai","3,2 MB"),
                            SaveFileWidget("Logotype-Twitter.ai","4,8 MB"),
                            SaveFileWidget("Logotype-Instagram.ai","21,8 MB"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(230, 250, 250, 250)
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: CupertinoButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromARGB(255, 250, 250, 250),
                          child: const Icon(Icons.close_rounded,
                              size: 40,
                              color: Color.fromARGB(255, 120, 120, 120)
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        )
    );
  }

}