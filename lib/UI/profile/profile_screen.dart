
import 'package:flutter/material.dart';

import '../Widgets/drawer_screen.dart';
import '../Widgets/listTile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                height: 120,
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
                            height: 80,
                            padding: const EdgeInsets.only(left: 50, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('User Name', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                    Text('eee@fad.com', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                  ],
                                ),
                                const SizedBox(width: 30,),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.edit,size: 30,),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 1,),
                      const ListTileScreen(iconData: Icons.shop_outlined, title: "My Orders"),
                      const ListTileScreen(
                          iconData: Icons.location_on_outlined,
                          title: "My Delivery Address"),
                      // const ListTileScreen(
                      //     iconData: Icons.person_outline, title: "Refer A Friends"),
                      // const ListTileScreen(
                      //     iconData: Icons.file_copy_outlined,
                      //     title: "Terms & Conditions"),
                      // const ListTileScreen(
                      //     iconData: Icons.policy_outlined, title: "Privacy Policy"),
                      const ListTileScreen(iconData: Icons.add_chart, title: "About"),
                      // const ListTileScreen(
                      //     iconData: Icons.exit_to_app_outlined, title: "Log Out"),
                    ],
                  ),
                ),
              )
            ],

          ),

          Padding(
            padding: const EdgeInsets.only(top:50.0, left: 150),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green.shade200,
              child: const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/319/218/png-transparent-sliced-apple-with-leaf-apple-juice-green-purxe9e-apple-natural-foods-food-green-apple-thumbnail.png"),
                //backgroundImage: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
              ),
            ),
          )
        ],
      ),

    );
  }
}
