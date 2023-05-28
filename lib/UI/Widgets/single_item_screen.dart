import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../provider/review_cart_provider.dart';
import 'count.dart';

class SingleItemScreen extends StatefulWidget {
  bool? isBool = false;
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int? productQuantity;
  VoidCallback? onDelete;
  SingleItemScreen({Key? key, this.isBool,
     required this.productName,
    required this.productImage,
     required this.productPrice,
    required this.productId,
    this.productQuantity,
    this.onDelete,
  }) : super(key: key);

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
 late ReviewCartProvider reviewCartProvider;
 int count = 1;
 getCount(){
   setState(() {
     count = widget.productQuantity!;
   });
 }
 // @override
 //  void initState() {
 //    // TODO: implement initState
 //    super.initState();
 //    getCount();
 //  }

  @override
  Widget build(BuildContext context) {
    //print('cart value : ${widget.productQuantity}');
    getCount();
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical:5 ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      height: 100,
                      child: Image.network(widget.productImage))),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: widget.isBool == false
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs ${widget.productPrice}",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    widget.isBool == false
                        ? Container(
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    '500 Gram',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                // Center(
                                //   child: Icon(Icons.arrow_drop_down),
                                // ),
                              ],
                            ),
                          )
                        : Text('500 gram')
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 110,
                padding: widget.isBool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: widget.isBool == false ? Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(30),
        ),
        child: CounterScreen(
    productId: widget.productId,
    productImage: widget.productImage,
    productName: widget.productName,
    productPrice: widget.productPrice,

    )
    //change add dynamicallay
                    // ? Container(
                    //     height: 25,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Center(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: const [
                    //           Icon(
                    //             Icons.add,
                    //             color: Colors.grey,
                    //           ),
                    //           Text(
                    //             'Add1',
                    //             style: TextStyle(color: Colors.grey),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: widget.onDelete,
                                child: Icon(Icons.delete)
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    InkWell(
                                      onTap: (){
                                        if(count==1){
                                          Fluttertoast.showToast(msg: "Can't be less than 1");
                                        }else{
                                          setState(() {
                                            count--;
                                          });
                                          reviewCartProvider.updateReviewCart(
                                              cartId: widget.productId,
                                              cartImage: widget.productImage,
                                              cartName: widget.productName,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count,
                                          );
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '$count',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    InkWell(
                                      onTap: (){
                                          setState(() {
                                            count++;
                                          });
                                          reviewCartProvider.updateReviewCart(
                                            cartId: widget.productId,
                                            cartImage: widget.productImage,
                                            cartName: widget.productName,
                                            cartPrice: widget.productPrice,
                                            cartQuantity: count,
                                          );
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),

              ),

              ),

            ],
          ),
          SizedBox(height: 10),
          Divider(height: 1, color: Colors.black87,)
        ],
      ),
    );
  }
}
