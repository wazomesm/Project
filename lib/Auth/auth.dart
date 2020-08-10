import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_travel/Auth/analytics_service.dart';
import 'package:safe_travel/Auth/database.dart';
import 'package:safe_travel/main.dart';

/// This page contains authentication, analytics and user classes**/

///Authentication
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirestoreService _firestoreService = locator<FirestoreService>();
  final AnalyticsService _analyticsService = AnalyticsService();

  ///create user object based on FirebasUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  ///auth change user screen
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  /// signin with email/password
  Future signinemailpass(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  ///signup in with email/password
  Future regemailpass(@required String email, @required String password,
      String nickname) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;

      await Dbservice(uid: user.uid).updateUserData(email, password, nickname);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
/*  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _userFromFirebaseUser(user);
      await _analyticsService.setUserProperties(
        uid: user.uid,
        nickname: _currentUser.nickname,
      );*/

//signout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

///user
class User {
  final String uid;
  final String nickname;
  User({this.uid, this.nickname});
}
