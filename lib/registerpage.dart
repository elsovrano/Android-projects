import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLogInPage;
  const RegisterPage({Key? key, required this.showLogInPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  Future signUp() async{

    if(passwordConfirmed()){

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text
      );

  }

  }

  bool passwordConfirmed(){
    if(_passwordController.text == _passwordConfirmController.text){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(

          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text('HELLO!',
                style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(20),
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
                ),
                  //TODO: Password TextFields
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

              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DecoratedBox(decoration:
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)
                  ),
                  color: Colors.white,
                ),
                  //TODO: Password TextFields
                  child: Padding(padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _passwordConfirmController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: ' Confirm Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 10,),


              //TODO: Implement Sign Up Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: widget.showLogInPage,
                    child: const Text('I am already a member!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                    ),
                  ),
                ],
              ),
            ]
          )
        )
      )
    );



  }
}
