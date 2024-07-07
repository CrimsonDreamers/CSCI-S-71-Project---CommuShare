import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commushare_front/model/availability.dart';

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
    }).toList();
  }

  Future<void> addItem(Item item) async {
    await ItemsCollection.doc(item.id).set(item.toJson());
  }

  Future<void> setItemAvailability(Item item, Availability availability) async {
    await ItemsCollection.doc(item.id).set({"availability": availability.toJson()}, SetOptions(merge: true));
  }
}
