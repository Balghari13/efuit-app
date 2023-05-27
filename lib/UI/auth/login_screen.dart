
import 'package:e_fruit_app/UI/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Widgets/round_button.dart';
import '../Widgets/utilis/utils.dart';
import '../shop/fruits_home.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logIn(){

    setState(() {
      loading=true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString()).then((value){
          Utils().toastMessage(value.user!.email.toString());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FruitsHomeScreen()));
          setState(() {
            loading=false;
          });
    }).onError((error, stackTrace){
      Utils().toastMessage(error.toString());
      setState(() {
        loading=false;
      });
     // debugPrint(error);
    });
  }


  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: ()async{
    //     SystemNavigator.pop();
    //     return true;
    //   },
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Log In'),
        ),
        body: Container(
          width: double.infinity,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          helperText: 'e.g adb@faa.com',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),

                RoundButton(title: 'Log In',loading: loading, onTap: (){
                  if(_formKey.currentState!.validate()){
                    logIn();
                  }
                },),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                    }, child: const Text('Sign Up')),
                  ],
                ),
                const SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FruitsHomeScreen()));
                }, child: const Text("Log In as Admin")),


                // InkWell(
                //   onTap: (){
                //     Navigator.pushReplacement(context,
                //         MaterialPageRoute(builder: (context)=>LoginWithNumber()));
                //   },
                //   child: Container(
                //     height: 50,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50),
                //       border: Border.all(
                //         color: Colors.black
                //       )
                //     ),
                //     child: Center(
                //       child: Text('Login with number'),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      );
    //);
  }
}
