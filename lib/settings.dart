import 'dart:html';

import 'package:flutter/material.dart';

import 'Auth/auth.dart';

class CustomInfoMenu extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 21.0, 0.0, 0.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MaterialButton(
                            //minWidth: 40,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/home');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('SafeTravel.',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade200,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          MaterialButton(
                            //minWidth: 40,
                            onPressed: () async {
                              await _auth.signout();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Log Out',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade200,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                      child: Text('Settings',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(235.0, 62.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15.0, 150.0, 15.0, 15.0),
                shadowColor: Colors.green,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/rules');
                  },
                  leading: CircleAvatar(

                      //backgroundImage: AssetImage('assets/stand.jpg'),
                      ),

                  //
                  title: Text('Email address change',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700)),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                shadowColor: Colors.green,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/contacts');
                  },
                  leading: CircleAvatar(
                      //backgroundImage: AssetImage('safe_travel/assets/usiu_logo.png'),
                      ),

                  //
                  title: Text('Password change',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700)),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                shadowColor: Colors.green,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('');
                  },
                  leading: CircleAvatar(

                      //backgroundImage: AssetImage('assets/stand.jpg'),
                      ),

                  //
                  title: Text('Admin Access',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/** @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text("This page is dedicated to giving your important Road Safety information that you may refer at your discretion."),
Text(" "),
          Text("Kenya Road Rules and Regulations are set by the National Roads ans Safety Association and enforced by the Kenya Police. Stay knowledgeful on Road Rules by going through these Regulations, tap the below tile..."),
          ListTile(
            leading: Icon(Icons.chrome_reader_mode),
            title: Text("Road Safety Rules and Regulations"),
            onTap: (){
              print('Page not yet up... ');
            },
          ),
          Text(" "),
          Text("IMPORTANT"),
          Text("Tap the tile below to find numbers that you can use incase of road emergency."),
          ListTile(
            leading: Icon(Icons.ring_volume),
            title: Text("Emergency Numbers"),
            onTap: (){
              print('Page not yet up... ');
            },
          ),
        ],
      )

    );
  }






**/
