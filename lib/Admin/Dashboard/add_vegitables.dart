import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddVegitablesAdmin extends StatefulWidget {
  const AddVegitablesAdmin({Key? key}) : super(key: key);

  @override
  State<AddVegitablesAdmin> createState() => _AddVegitablesAdminState();
}

class _AddVegitablesAdminState extends State<AddVegitablesAdmin> {
  final _controllerName = TextEditingController();
  final _controllerPrice = TextEditingController();
  final _controllerId = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('VegitablesList');

  String imageUrl = '';
  clearText() {
    _controllerName.clear();
    _controllerPrice.clear();
    _controllerId.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration:
                InputDecoration(hintText: 'Enter the name of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerPrice,
                keyboardType: TextInputType.number,
                decoration:
                InputDecoration(hintText: 'Enter the price of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price of quantity';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerId,
                decoration:
                InputDecoration(hintText: 'Enter the uniqueId for item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter uniqueId for  quantity';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                    print('${file?.path}');

                    if (file == null) return;
                    String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                    referenceRoot.child('image');
                    Reference referenceImageToUpload =
                    referenceDirImages.child('name');

                    try {
                      await referenceImageToUpload.putFile(File(file!.path));
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                      Fluttertoast.showToast(msg: 'image added successfull');
                    } catch (error) {
                      Fluttertoast.showToast(msg: 'Some Error... $error');
                    }
                  },
                  icon: Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Please upload an image')));

                      return;
                    }

                    if (key.currentState!.validate()) {
                      String itemName = _controllerName.text;
                      String itemPrice =( _controllerPrice.text) ;
                      String itemId = _controllerId.text;

                      //Create a Map of data
                      Map<String, dynamic> dataToSend = {
                        'productName': itemName,
                        'price': int.parse(itemPrice),
                        'productId': itemId,
                        'productImage': imageUrl,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                      clearText();
                      Fluttertoast.showToast(msg: 'Data Added');
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}