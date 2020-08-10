import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_travel/Auth/auth.dart';

class Dbservice {
  final String uid;
  Dbservice({this.uid});

  final CollectionReference UserRef = Firestore.instance.collection('Users');

  Future updateUserData(String email, String nickname, String role) async {
    return await UserRef.document(uid).setData({
      'email': email,
      'nickname': nickname,
      'member': role,
    });
  }
}
