
import 'package:e_fruit_app/UI/review/review_cart.dart';
import 'package:e_fruit_app/UI/shop/product_details.dart';
import 'package:e_fruit_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/drawer_screen.dart';
import '../searchList/search_screen.dart';
import 'fruits_list.dart';

class FruitsHomeScreen extends StatefulWidget {
   const FruitsHomeScreen({Key? key}) : super(key: key);

  @override
  State<FruitsHomeScreen> createState() => _FruitsHomeScreenState();
}

class _FruitsHomeScreenState extends State<FruitsHomeScreen> {
  late ProductProvider productProvider;
   // Widget singleProduct(){
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductProvider productProvider = Provider.of(context,listen: false);
    productProvider.fetchFruitsData();
    productProvider.fetchVegitablesData();
  }
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SearchScreen(
                  search: productProvider.searchAllProducts,
                )));
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen()));
          }, icon: const Icon(Icons.shop)),
        ],
      ),
      drawer:  DrawerScreen(),
      // drawer: Drawer(
      //   child: Container(
      //     width: 100,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Colors.green.shade200, Colors.green],
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //       child: ListView(
      //         children: [
      //           DrawerHeader(child: Column(
      //             children: [
      //               CircleAvatar(
      //                 backgroundColor: Colors.green,
      //                 radius: 43,
      //                 child: CircleAvatar(
      //                   backgroundColor: Colors.green.shade100,
      //                   radius: 40,
      //                   backgroundImage: const NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
      //                 ),
      //               ),
      //               const SizedBox(height: 15,),
      //               const Text('User Name'),
      //               const Text('User Email'),
      //             ],
      //           )),
      //           const SizedBox(height: 20,),
      //           DrawerScreen(iconData: Icons.home, title: 'Home', onTap: (){
      //              },),
      //            DrawerScreen(iconData: Icons.person, title: 'Profile', onTap: () {
      //              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
      //
      //            },),
      //         DrawerScreen(iconData: Icons.shop, title: 'Shopping Cart', onTap: () {},),
      //            DrawerScreen(iconData: Icons.notifications, title: 'Notifications', onTap: () {},),
      //            DrawerScreen(iconData: Icons.favorite, title: 'Wishlist', onTap: () {},),
      //           const SizedBox(height: 30,),
      //           ElevatedButton(onPressed: (){}, child: const Text('Log Out')),
      //          const SizedBox(height: 35,),
      //          Column(
      //            children: const [
      //              Text('Contact Support', style: TextStyle(fontWeight: FontWeight.bold),),
      //              Text('Call us: +92123231212'),
      //              Text('Email us: support@fruit.com'),
      //            ],
      //          ),
      //
      //         ],
      //
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade300, Colors.green],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,),
                  borderRadius: BorderRadius.circular(12),
            ),
              child: Stack(

                children: [
                  Positioned(
                    left:10,
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        )
                      ),
                      child: const Center(
                        child: Text('  30%\nOFF',textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            shadows: [BoxShadow(
                          color: Colors.white,
                              blurRadius: 10,
                              offset: Offset(3,3),
                        )]),),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text(' Discount on Fresh' ,style: TextStyle(fontSize: 18, color: Colors.white),),
                     SizedBox(height: 10,),
                      Text(' Fruits & Vegetables ', style: TextStyle(fontSize: 20, backgroundColor: Colors.yellow),),

                    ],
                  )),

                ],
              ),
        ),
const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Fresh Fruits'),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(
                         search: productProvider.fruitsList,
                       )));
                     },
                       child: Text('View All', style: TextStyle(color: Colors.grey),
                       ),
                   )

                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: productProvider.fruitData
                    .map((fruitsList){
                      return FruitsListScreen(
                          onTap: (){
                            debugPrint('click');
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>
                                ProductDetailsScreen(
                                  productId: fruitsList.productId,
                              productName: fruitsList.productName ,
                              productImage: fruitsList.productImage,
                                  price: fruitsList.productAmount,
                            )));
                          },
                            productImage: fruitsList.productImage,
                            productName: fruitsList.productName,
                            price: fruitsList.productAmount,
                        productId: fruitsList.productId,

                    );
                }).toList(),
               // [

              //     FruitsListScreen(
              //       onTap: (){
              //         debugPrint('click');
              //         Navigator.push(context,MaterialPageRoute(builder: (context)=>const ProductDetailsScreen(
              //           productName: 'Apple0011', productImage: 'assets/images/apple.png',
              //         )));
              //       },
              //         productImage: 'assets/images/apple.png',
              //         productName: 'Apple01',
              // ),
                  // FruitsListScreen(
                  //     productImage: 'assets/images/apple.png',
                  //     productName: 'Mango', onTap: (){}),
                  // FruitsListScreen(
                  //     productImage: 'assets/images/apple.png',
                  //     productName: 'Apple', onTap: (){}),
                  // FruitsListScreen(
                  //     productImage: 'assets/images/apple.png',
                  //     productName: 'Mango', onTap: (){}),
               // ],
              ),
            ),
const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Fresh Vegetables'),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(
                           search: productProvider.vegitablesList)));
                     },
                       child: Text('View All', style: TextStyle(color: Colors.grey),))

                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: productProvider.vegitableData
                  .map((vegitablesList){
            return FruitsListScreen(
            onTap: (){
            debugPrint('click');
            Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailsScreen(
            productName: vegitablesList.productName ,
            productImage: vegitablesList.productImage,
              price: vegitablesList.productAmount,
              productId: vegitablesList.productId,
            )));
            },
            productImage: vegitablesList.productImage,
            productName: vegitablesList.productName,
            price: vegitablesList.productAmount,
              productId: vegitablesList.productId,

            );
            }).toList(),

              ),
            ),

      ]),
    ),
    );
  }
}
