import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);

  final _user = FirebaseAuth.instance.currentUser!;
  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as ${_user.email!}',
            style: const TextStyle(fontSize: 18,
            fontWeight: FontWeight.w500),),
            MaterialButton(
                onPressed: signOut,
              child: const Text('Sign out',
                style: TextStyle(color: Colors.deepPurple),
              ),
            )
          ],
        )
      ),
    );
  }


}
