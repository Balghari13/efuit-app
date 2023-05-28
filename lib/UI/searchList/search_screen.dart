
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../Widgets/single_item_screen.dart';

class SearchScreen extends StatefulWidget {
final List<ProductModel> search;
  const SearchScreen({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
String query='';
class _SearchScreenState extends State<SearchScreen> {

    searchItem(String query){
    List<ProductModel> searchList = widget.search.where((element){
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchList;
  }

  @override
  Widget build(BuildContext context) {
      List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: ListView.builder(
        itemCount: 1,
          itemBuilder: (context,index){
        return Column(
          children: [
            ListTile(
              title: Text('Items'),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value){
                  //print(value);
                  setState(() {
                    query= value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: 'Search for Items',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 10,),

            Column(
              children: _searchItem.map((data){
                return SingleItemScreen(
                  isBool: false,
                  productName: data.productName,
                  productImage: data.productImage,
                  productPrice: data.productAmount,
                  productId: data.productId,
                  productQuantity: 1,
                );
              }).toList(),
            )


            //statically calling
            // SingleItemScreen(isBool: false,),
            // SingleItemScreen(isBool: false),
            // SingleItemScreen(isBool: false),
            // SingleItemScreen(isBool: false),
          ],
        );
      })






      //static data
      // ListView(
      //   children: [
      //     ListTile(
      //       title: Text('Items'),
      //     ),
      //     Container(
      //       height: 52,
      //       margin: EdgeInsets.symmetric(horizontal: 20),
      //       child: TextField(
      //
      //         decoration: InputDecoration(
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(30),
      //             borderSide: BorderSide.none,
      //           ),
      //           fillColor: Colors.grey.shade300,
      //           filled: true,
      //           hintText: 'Search for Items',
      //           suffixIcon: Icon(Icons.search),
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 10,),
      //     SingleItemScreen(isBool: false,),
      //     SingleItemScreen(isBool: false),
      //     SingleItemScreen(isBool: false),
      //     SingleItemScreen(isBool: false),
      //
      //   ],
      // ),
    );
  }
}
