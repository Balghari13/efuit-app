
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier{

  late ProductModel productModel;
List<ProductModel> search = [];
  productsModel(QueryDocumentSnapshot element){
    productModel= ProductModel(
        productImage: element.get('productImage'),
        productName: element.get('productName'),
       productAmount: element.get('price'),
    );
    search.add(productModel);

  }

//fruits
  List<ProductModel> fruitsList = [];
  //List<ProductModel> newList = [];
  fetchFruitsData() async{
    List<ProductModel> newList = [];
QuerySnapshot value = await FirebaseFirestore.instance.collection("FruitsList").get();
// value.docs.forEach((element) {
//   productModel = ProductModel(
//     productImage: element.get('productImage'),
//     productName: element.get('productName'),
//     productAmount: element.get('price'),
//   );
//   newList.add(productModel);
// }
    for (var element in value.docs) {
      // productModel = ProductModel(
      //   productImage: element.get('productImage'),
      //   productName: element.get('productName'),
      //   productAmount: element.get('price'),
      // );
      productsModel(element);
      newList.add(productModel);
    }
fruitsList=newList;
notifyListeners();
  }
 List<ProductModel> get fruitData{
    return fruitsList;
  }
  
  //for vegitable
  List<ProductModel> vegitablesList = [];
  fetchVegitablesData() async{
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("VegitablesList").get();
// value.docs.forEach((element) {
//   productModel = ProductModel(
//     productImage: element.get('productImage'),
//     productName: element.get('productName'),
//     productAmount: element.get('price'),
//   );
//   newList.add(productModel);
// }
    for (var element in value.docs) {
      // productModel = ProductModel(
      //   productImage: element.get('productImage'),
      //   productName: element.get('productName'),
      //   productAmount: element.get('price'),
      // );
      productsModel(element);
      newList.add(productModel);
    }
    vegitablesList=newList;
    notifyListeners();
  }
  List<ProductModel> get vegitableData{
    return vegitablesList;
  }


  //for search
  List<ProductModel> get searchAllProducts{
    return search;
  }

}