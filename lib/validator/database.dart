import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference mainCollection = _fireStore.collection('notes');

class DataBase{
  static String? userId;
}
