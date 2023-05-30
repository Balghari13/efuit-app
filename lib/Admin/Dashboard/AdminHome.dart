import 'package:e_fruit_app/Admin/Dashboard/remove_fruits.dart';
import 'package:e_fruit_app/Admin/Dashboard/remove_vegitables.dart';
import 'package:e_fruit_app/UI/searchList/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../UI/Widgets/round_button.dart';
import '../../UI/auth/login_screen.dart';
import '../../provider/product_provider.dart';
import 'add-fruits.dart';
import 'add_vegitables.dart';


class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            });
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Produtcs', style: TextStyle(fontSize: 25),),
              SizedBox(height: 10,),
              RoundButton(title: 'Add Fruits',onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFruitsAdmin()));
              },),
              SizedBox(height: 10,),
              RoundButton(title: 'Add Vegitabels', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVegitablesAdmin()));
              }),
              SizedBox(height: 10,),
              RoundButton(title: 'Remove Fruits', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RemoveFruits()));
              }),
              SizedBox(height: 10,),
              RoundButton(title: 'Remove Vegitables', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RemoveVegitables()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
