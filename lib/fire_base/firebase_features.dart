// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _store = FirebaseStorage.instance;
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  Future<User?> resetpass(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }
}

//  CRUD operation starts

// C - CREATE COLLECTION AND Store DATA IN IT
class FirebaseDataServie {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final FirebaseStorage _read = FirebaseStorage.instance;
  Future<void> addData(
      String collection, String gmail, String name, String phone) async {
    _database
        .collection(collection)
        .doc(gmail)
        .set({'Name': name, 'PHno': phone})
        .whenComplete(() => print("Added Data"))
        .catchError((e) {
          print(e.toString());
        });
  }

  Future<void> addbio(
      String collection, String gmail, String bio, String proff) async {
    _database
        .collection(collection)
        .doc(gmail)
        .update({'Bio': bio, 'Proffession': proff})
        .whenComplete(() => print("Updated Data"))
        .catchError((e) {
          print(e.toString());
        });
  }

  // Still a part of C - Create and Store Data , Here we will upload pictures.

  //Pictures are not stored in firestore rather than in firebase cloud storage.
  Future<void> addpic(String collection, String gmail, String picurl) async {
    _database
        .collection(collection)
        .doc(gmail)
        .update({"picurl": picurl})
        .whenComplete(() => print("Updated Data"))
        .catchError((e) {
          print(e.toString());
        });
  }
// R - READ THE DATA IN FIREBASE_FIRESTORE

  Future<void> readData(String doc, String field) async {
    final CollectionReference collectionref = _database.collection('users');
    await collectionref.doc(doc).get().then((value) {
      var docfields = value;

      return docfields[field];
    });
  }

  Future<void> readpic(String name) {
    return _read.ref().child("Flutter.png").getDownloadURL();
  }
}
