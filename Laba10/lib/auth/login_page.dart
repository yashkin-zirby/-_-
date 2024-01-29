import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }

}
class LoginPageState extends State<LoginPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String? _userEmail;
  late String _userSuccess = "";
  void _login() async{
    setState(() {
      _userSuccess = "";
    });
    try {
      if(_auth.currentUser != null && _auth.currentUser?.email == _emailController.text){
        setState(() {
          _userSuccess = "You already sign in as ${_auth.currentUser?.email}";
          goToFireStore();
        });
        return;
      }
      final User? user = (
          await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
      ).user;
      if (user != null) {
        setState(() {
          _userSuccess = "Sign in successful";
          _userEmail = user.email;
        });
        goToFireStore();
      } else {
        setState(() {
          _userSuccess = "invalid email or password";
        });
      }
    }catch(e){
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
            child: const Text("Login Page",
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
                Text(_userSuccess),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.indigoAccent,
                    color: Colors.black,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: (){_login();},
                      child: const Center(
                        child: Text(
                          "Login",
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
                      onTap: (){Navigator.of(context).pushNamed("/register");},
                      child: const Text("Or Register",
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