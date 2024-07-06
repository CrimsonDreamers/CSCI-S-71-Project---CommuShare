import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/item.dart';

class DatabaseService {
  DatabaseService();

  final CollectionReference<Map<String, dynamic>> ItemsCollection =
      FirebaseFirestore.instance.collection("items");

  Future<List<Item>> getItems() {
    return ItemsCollection.get()
        .then((value) => _ItemsListFromSnapshot(value.docs));
  }

  List<Item> _ItemsListFromSnapshot(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot.map((doc) {
      return Item.fromJson(doc.data());
      //return Item(id: "1",name: "test");
    }).toList();
  }
}
