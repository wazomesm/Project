import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Auth/auth.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //appBar: ,
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
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
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Safe',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('Travel',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(230.0, 167.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 90.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ),
          Container(
            child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                child: Text(
                    'SafeTravel is a road safety app that is focused on giving you the power of knoweldge. ',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 150.0, 0.0, 0.0),
                child: Text('Know your Rights. ',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade200)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 187.0, 0.0, 0.0),
                child: Text('Know the Rules.',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade700)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 222.0, 0.0, 0.0),
                child: Text('Know the Risk.',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 280.0, 0.0, 0.0),
                child: Text(
                    'SafeTravel has a simple and clear design so you can use it like an expert in no time at all.',
                    style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
              SizedBox(height: 20.0)
            ]),
          )
        ]),
      ]),
    );
  }
}
