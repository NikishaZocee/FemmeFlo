import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:periods/components/my_button.dart';
import 'package:periods/pages/login.dart';

import '../Firebase_auth.dart';
import '../Form_controller.dart';
class register extends StatefulWidget {
  register({super.key,});


  @override
  State<register> createState() => _loginState();
}
class _loginState extends State<register> {
//text controllers

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  //register method
  void main(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 213, 200, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).colorScheme.primary,),
              SizedBox(height: 25,),

              SizedBox(height: 25,),
              //textfield for email
              FormContainerWidget(
                hintText: "Enter name",
                controller: usernamecontroller,
              ),
              SizedBox(height: 10),

              FormContainerWidget(
                hintText: "Enter Email",
                controller: emailcontroller,
              ),
              SizedBox(height: 10),

              //textfield for password
              FormContainerWidget(
                hintText: "Enter password",
                controller: passwordcontroller,
              ),
              SizedBox(height: 10,),
              FormContainerWidget(
                hintText: "Confirm password",
                controller: confirmpasswordcontroller,
              ),

              SizedBox(height: 25,),
              MyButton(
                text: "Login",
                onTap: (){
                  return _signup();

                },
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return login();
                        }));
                      },
                      child: Text(" Login Here",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),))
                ],
              ),


            ],

          ),
        ),
      ),
    );
  }
  void _signup()async{
    String password =passwordcontroller.text;
    String  firstname =usernamecontroller.text;
    String email = emailcontroller.text;

    User? user = await _auth.signup(email,password,firstname);

    if (user!= null){
      print("User is sucessfully created");
      print(FirebaseAuth.instance);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
    else{
      print("Error");
    }
  }
}

