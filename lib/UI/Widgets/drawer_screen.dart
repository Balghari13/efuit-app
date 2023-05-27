
import 'package:e_fruit_app/UI/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import '../review/review_cart.dart';
import '../shop/fruits_home.dart';
import 'listTile_screen.dart';

class DrawerScreen extends StatelessWidget {
  // final IconData iconData;
  // final String title;
  // final VoidCallback onTap;
  DrawerScreen({Key? key,
    }) : super(key: key);

  // Widget listTile({IconData? iconData, String? title, VoidCallback? onTap}){
  //     return ListTile(
  //       onTap: onTap,
  //       leading: Icon(iconData),
  //       title: Text(title!),
  //
  //     );
  //   }
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade200, Colors.green],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                DrawerHeader(child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 43,
                      child: CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        radius: 40,
                        backgroundImage: const NetworkImage(''
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('User Name'),
                    const Text('User Email'),
                  ],
                )),
                const SizedBox(height: 20,),
                ListTileScreen(iconData: Icons.home, title: 'Home', onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitsHomeScreen()));
                },),
                ListTileScreen(iconData: Icons.person, title: 'Profile', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));

                },),
                ListTileScreen(iconData: Icons.shop, title: 'Shopping Cart', onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const ReviewCartScreen()));

                },),
                ListTileScreen(iconData: Icons.notifications, title: 'Notifications', onTap: () {},),
                ListTileScreen(iconData: Icons.favorite, title: 'Wishlist', onTap: () {},),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  auth.signOut().then((value){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  });
                }, child: const Text('Log Out')),
                const SizedBox(height: 35,),
                Column(
                  children: const [
                    Text('Contact Support', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Call us: +92123231212'),
                    Text('Email us: support@fruit.com'),
                  ],
                ),

              ],

            ),
          ),
        ),
      );

}}
