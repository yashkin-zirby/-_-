import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;
class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}
class RegisterPageState extends State<RegisterPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const goToLoginLink = Key("GoToLoginPageLink");
  late String? _userEmail;
  late String _userSuccess = "";
  void _register() async{
    setState(() {
      _userSuccess = "";
    });
    try {
      final User? user = (
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
      ).user;
      if (user != null) {
        setState(() {
          _userSuccess = "successful registration";
          _userEmail = user.email;
        });
        goToFireStore();
      } else {
        setState(() {
          _userSuccess = "User already exist";
        });
      }
    }catch (e) {
      setState(() {
        _userSuccess = e.toString();
      });
    }
  }
  void goToFireStore(){
    Navigator.of(context).pushNamed("/fire-store");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
            child: const Text("Register Page",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(35, 20, 30, 0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  _userSuccess,

                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.indigoAccent,
                    color: Colors.black,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: (){_register();},
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      key: goToLoginLink,
                      onTap: (){Navigator.of(context).pushNamed("/login");},
                      child: const Text("Or Sign in",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}