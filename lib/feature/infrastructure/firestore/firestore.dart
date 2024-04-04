import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  Firestore._();

  static DocumentReference<Map<String, dynamic>> get version =>
      FirebaseFirestore.instance.collection('versions').doc('1');

  static CollectionReference<Map<String, dynamic>> get user =>
      version.collection('users');

  static CollectionReference<Map<String, dynamic>> get article =>
      version.collection('articles');

  static CollectionReference<Map<String, dynamic>> get prefecture =>
      version.collection('prefectures');

  static CollectionReference<Map<String, dynamic>> get sake =>
      version.collection('sakes');
}
