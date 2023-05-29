
import 'package:e_fruit_app/models/review_cart_model.dart';
import 'package:e_fruit_app/provider/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Widgets/single_item_screen.dart';

class ReviewCartScreen extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;

 ReviewCartScreen({Key? key}) : super(key: key);


  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.deleteCart(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete cart"),
      content: Text("Confirm delete cart product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text('Rs ${reviewCartProvider.getTotalPrice()}'),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Buy Now"),
            onPressed: (){
Fluttertoast.showToast(msg: 'Ordering.....', timeInSecForIosWeb: 2);
            },
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Review Cart'),
      ),
      body: reviewCartProvider.getReviewList.isEmpty? Center(
         child: Text('No Item Selected')
      ):
      ListView.builder(
        itemCount: reviewCartProvider.reviewCartList.length,
        itemBuilder: (context,index){
          ReviewCartModel data = reviewCartProvider.reviewCartList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItemScreen(
                productName: data.cartName,
                productImage: data.cartImage,
                productPrice: data.cartPrice,
                productId: data.cartId,
                productQuantity: data.cartQuantity,
                onDelete: (){
                  showAlertDialog(context,data);
                },
              ),
            ],
          );
        },
        // children: [
        //
        //   // SingleItemScreen(),
        //   // SingleItemScreen(),
        //   // SingleItemScreen(),
        //
        //
        // ],

      ),
    );
  }
}
