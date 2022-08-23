import 'package:flutter/material.dart';
import './Setup/login.dart';
import './registerpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{

  //boolean to check for authentication
  bool showLogInPage = true;

  void toggleScreens(){
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(showLogInPage){
      return LogInPage(showRegisterPage: toggleScreens);
    }
    else{
      return RegisterPage(showLogInPage: toggleScreens);
    }

  }

}