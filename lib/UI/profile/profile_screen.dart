
import 'package:e_fruit_app/UI/review/review_cart.dart';
import 'package:e_fruit_app/UI/shop/fruits_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Widgets/drawer_screen.dart';
import '../Widgets/listTile_screen.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
        drawer: DrawerScreen(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10) ,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  ),
                  child: ListView(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            padding: const EdgeInsets.only(left: 50, top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Balghari', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                    SizedBox(height: 10,),
                                    Text('abc@gmail.com', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                  ],
                                ),
                                const SizedBox(width: 30,),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      const Divider(height: 1,),
                      ListTileScreen(
                        iconData: Icons.home_outlined,
                        title: "Home", onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitsHomeScreen()));
                      },
                      ),
                      ListTileScreen(iconData: Icons.shop_outlined, title: "My Orders", onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen()));
                      },),
                      ListTileScreen(iconData: Icons.payment_outlined, title: "Payments Details", onTap: (){
                        Fluttertoast.showToast(msg: 'No record found');
                      },),
                      ListTileScreen(iconData: Icons.logout_outlined, title: "LogOut", onTap: (){
                        auth.signOut().then((value){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        });
                      },),

                    ],
                  ),
                ),
              )
            ],

          ),

          Padding(
            padding: const EdgeInsets.only(top:80.0, left: 110),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.green.shade200,
              child: const CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
              ),
            ),
          )
        ],
      ),

    );
  }
}
