

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier{

  addReviewCart({
     required String cartId,
    required String cartImage,
    required String cartName,
     required int cartPrice,
    required int cartQuantity,
    //required bool isAdd,
}) async{
    await FirebaseFirestore.instance.collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourCart").doc(cartId).set({
      'cartId':cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isaAdd': true,
    });
  }


  //get data
  List<ReviewCartModel> reviewCartList = [];

  getReviewData() async{
    List<ReviewCartModel> newList = [];
   QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
       .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourCart").get();
   reviewCartValue.docs.forEach((element) {
     ReviewCartModel reviewCartModel = ReviewCartModel(
         cartName: element.get('cartName'),
         cartImage: element.get('cartImage'),
         cartPrice: element.get('cartPrice'),
         cartQuantity: element.get('cartQuantity'),
         cartId:element.get('cartId'),
     );
     newList.add(reviewCartModel);
   });
   reviewCartList= newList;
   notifyListeners();
  }

  List<ReviewCartModel> get getReviewList {
    return reviewCartList;
  }

  //delete cart

 deleteCart(cartId) {
    FirebaseFirestore.instance.collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourCart').doc(cartId).delete();
    notifyListeners();
 }

 //update
  updateReviewCart({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
    //required bool isAdd,
  }) async{
    await FirebaseFirestore.instance.collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourCart").doc(cartId).update({
      'cartId':cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isaAdd': true,
    });
  }

}