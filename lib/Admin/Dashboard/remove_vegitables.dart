import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class RemoveVegitables extends StatefulWidget {
  RemoveVegitables({Key? key}) : super(key: key);

  @override
  _RemoveVegitablesState createState() => _RemoveVegitablesState();
}

class _RemoveVegitablesState extends State<RemoveVegitables> {
  final Stream<QuerySnapshot> vegitablesStream =
  FirebaseFirestore.instance.collection('VegitablesList').snapshots();

  // For Deleting User
  CollectionReference vegitables =
  FirebaseFirestore.instance.collection('VegitablesList');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return vegitables
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: vegitablesStream,
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
