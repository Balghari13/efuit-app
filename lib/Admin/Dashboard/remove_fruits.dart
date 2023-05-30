import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class RemoveFruits extends StatefulWidget {
  RemoveFruits({Key? key}) : super(key: key);

  @override
  _RemoveFruitsState createState() => _RemoveFruitsState();
}

class _RemoveFruitsState extends State<RemoveFruits> {
  final Stream<QuerySnapshot> fruitsStream =
  FirebaseFirestore.instance.collection('FruitsList').snapshots();

  // For Deleting User
  CollectionReference fruits =
  FirebaseFirestore.instance.collection('FruitsList');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return fruits
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: StreamBuilder<QuerySnapshot>(
          stream: fruitsStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('Something went Wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final List storedocs = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map a = document.data() as Map<String, dynamic>;
              storedocs.add(a);
              a['id'] = document.id;
            }).toList();

            return ListView.builder(
                itemCount: storedocs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(storedocs[index]['productName']),
                    //subtitle: Text(storedocs[index]['price']),
                    trailing: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => {deleteUser(storedocs[index]['id'])},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
