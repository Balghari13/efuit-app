
import 'package:flutter/material.dart';

import '../Widgets/bottom_navbar.dart';


class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  //final int price;
  const ProductDetailsScreen({Key? key,
    required this.productName, required this.productImage,}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: const [
          BottomNavBarScreen(
              iconColor: Colors.white,
              backgroundColour: Color(0xff2abe25),
              color: Colors.black,
              title: 'Add to Wishlist',
              iconData: Icons.favorite
      ),
          BottomNavBarScreen(
              iconColor: Colors.black,
              backgroundColour: Color(0xff1d851a),
              color: Colors.white,
              title: 'Go to Cart',
              iconData: Icons.shopping_cart,
          ),

        ],
      ),
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
              Expanded(
                flex: 2,
                  child: Container(
                width: double.infinity,
                    child: Column(
                      children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 20.0),
                         child: Center(child: Text(
                           widget.productName
                           ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                       ),
                        Container(
                          height: 250,
                          padding: const EdgeInsets.all(40),
                          child: Image.network(widget.productImage,),
                        ),

                        const ListTile(
                          title: Text('Details'),
                          subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const[
                                  Text('500 gram'),
                                 // Icon(Icons.arrow_drop_down),
                                ],
                              ),

                            )),
                            const SizedBox(width: 5,),
                            Expanded(child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const[
                                  Icon(Icons.remove, size: 15,),
                                  Text('1', style: TextStyle(fontWeight: FontWeight.bold),),
                                  Icon(Icons.add, size: 15,),
                                ],
                              ),
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
              ))
        ],
      ),
    );
  }
}
