import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:profile_section/authpage.dart';
import './Setup/login.dart';
import 'homepage.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage();
          }else{
            return AuthPage();
          }
        },
      ),

    );
  }


}