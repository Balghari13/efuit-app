
import 'package:e_fruit_app/UI/review/review_cart.dart';
import 'package:flutter/material.dart';

import '../Widgets/bottom_navbar.dart';
import '../Widgets/count.dart';


class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final int price;
  final String productId;
   ProductDetailsScreen({Key? key,
    required this.productName, required this.productImage, required this.productId,
    required this.price,}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children:  [
          BottomNavBarScreen(
              iconColor: Colors.black,
              backgroundColour: Color(0xff1d851a),
              color: Colors.white,
              title: 'Go to Cart',
              iconData: Icons.shopping_cart,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen()));
              },
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
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  //color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    Text('Rs ${widget.price}'),
                                    SizedBox(height: 5,),
                                    Text('500 gram'),

                                  ],
                                ),

                              ),
                            )),
                            const SizedBox(width: 5,),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.green.shade300,
                                    )
                                ),
                              child: CounterScreen(
                                productId: widget.productId,
                                productImage: widget.productImage,
                                productName: widget.productName,
                                productPrice: widget.price,

                              ),
                              // Container(
                              //   height: 35,
                              //   width: 30,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //     border: Border.all(
                              //       color: Colors.green.shade300,
                              //     ),
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: const[
                              //       Icon(Icons.add, size: 25,weight: 50, color: Colors.grey),
                              //       Text('ADD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 , color: Colors.grey),),
                              //     ],
                              //   ),
                              // ),
                            ),
                            ),
                            )],
                        ),
                      ],
                    ),
              ))
        ],
      ),
    );
  }
}
