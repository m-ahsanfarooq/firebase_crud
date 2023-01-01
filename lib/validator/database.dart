import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference mainCollection = _fireStore.collection('notes');

class DataBase {
  static String? userId;

  static Future<void> addItem({
    required String title,
    required String description,
  }) async {
    DocumentReference documentReference =
        mainCollection.doc(userId).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description
    };

    await documentReference
        .set(data)
        .whenComplete(
            () => debugPrint('Note item inserted to the database successfully'))
        .catchError((e) => debugPrint(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required documentId,
  }) async {
    DocumentReference documentReference =
        mainCollection.doc(userId).collection('item').doc(documentId);
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description
    };
    await documentReference
        .set(data)
        .whenComplete(
            () => debugPrint('Note item updated to the database successfully'))
        .catchError((e) => debugPrint(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        mainCollection.doc(userId).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({required String documentId}) async {
    DocumentReference documentReference =
        mainCollection.doc(userId).collection('items').doc(documentId);

    await documentReference
        .delete()
        .whenComplete(() => debugPrint('Note item deleted successfully'))
        .catchError((e) => debugPrint(e));
  }
}
