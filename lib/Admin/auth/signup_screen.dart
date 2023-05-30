import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../UI/Widgets/round_button.dart';
import '../../UI/Widgets/utilis/utils.dart';
import '../Dashboard/AdminHome.dart';
import 'login_screen.dart';


class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({Key? key}) : super(key: key);

  @override
  State<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
   addressController.dispose();
  }


   signUp() {
    setState(() {
      loading = true;
    });
    //User? user = FirebaseAuth.instance.currentUser;
    _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
          FirebaseFirestore.instance.collection
            ('adminData').doc(value.user!.uid)
      .set({
            //'email':value.user!.email,
            'name': nameController.text,
            'phone': phoneController.text,
            'email': emailController.text,
            'address': addressController.text,
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHome()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace){
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        helperText: 'e.g Balti',
                        prefixIcon: Icon(Icons.person_2),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Phone",
                        helperText: 'e.g 123567',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Phone Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Address",
                        helperText: 'e.g street no',
                        prefixIcon: Icon(Icons.location_city_outlined),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Address Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
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

              RoundButton(title: 'Sign Up', loading: loading, onTap: (){

                if(_formKey.currentState!.validate()){
           signUp();
                }
              },),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have already an account?"),
                  TextButton(onPressed: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminLoginScreen()));
                  }, child: Text('Log In')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

