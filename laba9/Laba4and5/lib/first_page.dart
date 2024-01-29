import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laba4and5/drink_list/drink.dart';
import 'package:laba4and5/drink_list/drinks_page_list.dart';
import 'package:laba4and5/get_battety_level.dart';
import 'package:laba4and5/second_page.dart';

class FirstPage extends StatelessWidget{
  FirstPage({super.key});
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Battery(),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 40),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: TextField(
                          obscureText: false,
                          controller: _controller,
                          decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                              labelText: 'What would you like?'
                          ),
                      ),
                    ),
                    IconButton(onPressed: (){
                      String text = _controller.text;
                      _controller.text = "";
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SecondPage(text)),
                      );
                    }, icon: const Icon(Icons.search_rounded, color: Colors.deepOrangeAccent))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top:20, bottom: 20),
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Welcome back",
                          style: TextStyle(
                              color: Color.fromARGB(255, 180, 180, 180),
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("Charlize Wong",
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ],),
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("https://i.imgur.com/IWN1rUL.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top:20, bottom: 20),
                  padding: const EdgeInsets.only(left: 20),
                  child: const DrinksPageList([Drink("Tea","https://top-fon.com/uploads/posts/2023-01/1674729992_top-fon-com-p-zelenii-chai-fon-dlya-prezentatsii-187.jpg"),
                    Drink("Wine","https://i.pinimg.com/originals/87/92/86/879286905a93a938b440ba223a11f5fd.jpg"),
                    Drink("Beer","https://www.wallpaperup.com/uploads/wallpapers/2017/10/26/1141303/07965fbae5662911e8d44dce4b516aed.jpg"),
                    Drink("Milk","https://ukrhalal.org/wp-content/uploads/2020/04/Fotolia_130481182_Subscription_Monthly_M.jpg"),
                    Drink("Juice","https://w.forfun.com/fetch/46/46385c0aab8155144558c384854ff40e.jpeg")]),
                  /*
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Tea",
                            style: TextStyle(
                                fontSize: 26,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange
                            )),

                        SizedBox(
                          width: 20, //<-- SEE HERE
                        ),
                        Text("Wine",
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent
                            )),
                        SizedBox(
                          width: 20, //<-- SEE HERE
                        ),
                        Text("Beer",
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent
                            )),
                        SizedBox(
                          width: 20, //<-- SEE HERE
                        ),
                        Text("Milk",
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent
                            )),
                        SizedBox(
                          width: 20, //<-- SEE HERE
                        ),
                        Text("Juice",
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent
                            )),
                      ],
                    ),
                  )
                  */
              ),
              /*
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 30, top:20, bottom: 20),
                      padding: const EdgeInsets.only(left: 20),
                      child: PageView(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 300,
                            height: 450,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://top-fon.com/uploads/posts/2023-01/1674729992_top-fon-com-p-zelenii-chai-fon-dlya-prezentatsii-187.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 300,
                            height: 450,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://i.pinimg.com/originals/87/92/86/879286905a93a938b440ba223a11f5fd.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 300,
                            height: 450,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://www.wallpaperup.com/uploads/wallpapers/2017/10/26/1141303/07965fbae5662911e8d44dce4b516aed.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 300,
                            height: 450,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://ukrhalal.org/wp-content/uploads/2020/04/Fotolia_130481182_Subscription_Monthly_M.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 300,
                            height: 450,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://w.forfun.com/fetch/46/46385c0aab8155144558c384854ff40e.jpeg"),
                              ),
                            ),
                          ),
                        ],
                      )
                  )
              ),
              */
            ],
          ),
        )
    );
  }

}