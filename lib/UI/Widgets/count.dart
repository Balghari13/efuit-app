import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_fruit_app/provider/review_cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;
   CounterScreen({Key? key,
  required this.productPrice, required this.productName,
     required this.productImage, required this.productId,
  }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 1;
  bool isTrue = false;

getQuantity(){
  FirebaseFirestore.instance
      .collection('ReviewCart').doc(FirebaseAuth.instance.currentUser!.uid)
  .collection('YourCart').doc(widget.productId).get().then((value){
   if(this.mounted){
     if(value.exists) {
       setState(() {
         count = value.get('cartQuantity');
         isTrue = value.get('isAdd');
       });
     }
   }
  });
}
  
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: isTrue==true ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          InkWell(
            onTap: (){
              if (count == 1) {
                setState(() {
                  isTrue = false;
                });
                reviewCartProvider.deleteCart(widget.productId);
              } else if (count > 1) {
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
              child: Icon(Icons.remove, size: 25, weight: 50,color: Colors.grey,)),
          Text('$count', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
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
              child: Icon(Icons.add, size: 25, weight: 50, color: Colors.grey, )),
        ],
      ): Center(child: InkWell(
          onTap: (){
            setState(() {
              isTrue = true;
              });
              reviewCartProvider.addReviewCart(
              cartId: widget.productId,
              cartImage: widget.productImage,
              cartName: widget.productName,
              cartPrice: widget.productPrice,
              cartQuantity: count,
             // isAdd: true,
            );
          },
          child: Text('ADD'))),
    );
  }
}
