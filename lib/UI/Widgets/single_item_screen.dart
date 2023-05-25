import 'package:flutter/material.dart';

class SingleItemScreen extends StatelessWidget {
  bool? isBool = false;
  String productName;
  String productImage;
  int productPrice;
  SingleItemScreen({Key? key, this.isBool,
    required this.productName,
    required this.productImage,
    required this.productPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical:5 ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      height: 100,
                      child: Image.network(productImage))),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: isBool == false
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs $productPrice",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    isBool == false
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
                height: 100,
                padding: isBool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: isBool == false
                    ? Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Column(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      'Add',
                                      style: TextStyle(color: Colors.grey),
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
