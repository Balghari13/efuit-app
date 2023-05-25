
import 'package:flutter/material.dart';

import '../Widgets/single_item_screen.dart';

class ReviewCartScreen extends StatelessWidget {
  const ReviewCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text('Rs 50'),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            onPressed: (){},
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
      body: ListView(
        children: [
          SizedBox(height: 10,),
          // SingleItemScreen(),
          // SingleItemScreen(),
          // SingleItemScreen(),
          // SingleItemScreen(),


        ],

      ),
    );
  }
}
