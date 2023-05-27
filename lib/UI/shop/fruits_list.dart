import 'package:e_fruit_app/UI/Widgets/count.dart';
import 'package:flutter/material.dart';

class FruitsListScreen extends StatelessWidget {
  final String
  productImage;
  final String productName;
  final int price;
  final VoidCallback onTap;
  const FruitsListScreen({Key? key,
     required this.productImage,
      required this.productName,
     required this.onTap, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 230,
      width: 175,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: onTap,
              child: Image.network(productImage),
            ),
          ),
          Expanded(child: Column(
            children: [
              Text(productName, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              const SizedBox(height: 2,),
               Text("Rs: $price", style: TextStyle(color: Colors.grey, fontSize: 12),),

              Padding (
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Row(
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
                      child: Center(child: Text('500 g')),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: const[
                      //     Text('500 gram'),
                      //     //Icon(Icons.arrow_drop_down),
                      //   ],
                      // ),

                    )),
                    const SizedBox(width: 5,),
                   Expanded(
                     flex: 2,
                       child: CounterScreen()
                    // Container(
                    //   height: 25,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //     //color: Colors.blue,
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: const[
                    //       Icon(Icons.remove, size: 15,),
                    //       Text('1', style: TextStyle(fontWeight: FontWeight.bold),),
                    //        Icon(Icons.add, size: 15,),
                    //     ],
                    //   ),
                    // ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ],
      ),

    );
  }
}
