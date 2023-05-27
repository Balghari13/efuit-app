
import 'dart:async';
import 'package:e_fruit_app/UI/shop/fruits_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login_screen.dart';

class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FruitsHomeScreen()))
      );
    }
    else{
      Timer(Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>LoginScreen())));
    }

}}