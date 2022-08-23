import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key, required this.showRegisterPage}) : super(key: key);
  final VoidCallback showRegisterPage;


  @override
  State<LogInPage> createState() => LogInPageState();
}




class LogInPageState extends State<LogInPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async{

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(

          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text('HELLO AGAIN!',
                style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(20),
                child: Text('Welcome back,we\'ve missed you!😊',
                  style: TextStyle(fontSize: 20,),
                )
                ),

              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DecoratedBox(decoration:
                const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)
                    ),
                  color: Colors.white,

                  //TODO: Email TextFields
                ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),


              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DecoratedBox(decoration:
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)
                  ),
                  color: Colors.white,

                  //TODO: Password TextFields
                ),
                  child: Padding(padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 10,),

              //Sign In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('Sign In',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member? ', style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text('Register', style: TextStyle(
                        color: Colors.blue,
                    fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),
      ),
    ),
    );
  }

}

