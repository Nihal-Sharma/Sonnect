import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

final FirebaseStorage _storage = FirebaseStorage.instance;

class StoreData {
  Future<String> uploadImage(String name, Uint8List file) async {
    Reference ref = _storage.ref().child(name);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;

    String downloadurl = await snapshot.ref.getDownloadURL();
    return downloadurl;
  }
}
