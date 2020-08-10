import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Auth/analytics_service.dart';
import 'Auth/auth.dart';
import 'Auth/dialog_manager.dart';
import 'Auth/dialog_service.dart';
import 'Auth/login.dart';
import 'Auth/reset.dart';
import 'Auth/resetpassword.dart';
import 'Auth/signup.dart';
import 'Information/contacts.dart';
import 'Information/rules.dart';
import 'Reports/ShowReports.dart';
import 'bottomNav.dart';
import 'safety.dart';
import 'settings.dart';

import 'Locator/locateFunction.dart';
//import 'package:get_it/get_it.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthService().user,
        child: MaterialApp(
          builder: (context, child) => Navigator(
            key: DialogService().dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
            //navigatorKey: locator<NavigationService>().navigationKey,
          ),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/signup': (BuildContext context) => new signupPage(),
            '/login': (BuildContext context) => new ULogin(),
//
            '/home': (BuildContext context) => CustomBottomBar(),
            '/info': (BuildContext context) => CustomInfoMenu(),
            '/locator': (BuildContext context) => CustomLocateMenu(),
            '/contacts': (BuildContext context) => ContactsView(),
            '/rules': (BuildContext context) => RulesView(),
            '/locate': (BuildContext context) => locateFunc(),
            '/resetpassword': (BuildContext context) => ResetPass(),
            '/resetpassword1': (BuildContext context) => ResetPass1(),
            '/reports': (BuildContext context) => reports(),
          },
          navigatorObservers: [AnalyticsService().getAnalyticsObserver()],
          home: Wrapper(),
        ));
  }
}

class Wrapper extends StatelessWidget {
  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

//return either home or login page
    if (user == null) {
      return ULogin();
    }
//    else if(user != null){
//      FirebaseAuth.instance.currentUser().then((user) {
//        Firestore.instance.collection('/Users')
//            .where('uid', isEqualTo: user.uid)
//        .getDocuments().then((docs){
//          if(docs.documents[0].exists) {
//            if (docs.documents[0].data['role'] == 'admin') {
//              Navigator.of(context).pushNamed('/adminhome');
//            } else {
//              print('Not Authorized');
//            }
//          }});
//      });
//    }

    else {
      return CustomBottomBar();
    }
  }
}
