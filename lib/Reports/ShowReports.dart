import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safe_travel/Auth/auth.dart';
import 'package:safe_travel/Information/rules.dart';

class reports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return reportsState();
  }
}

class reportsState extends State<reports> {
  final AuthService _auth = AuthService();

  String _todoName = 'Display Here';

  Widget build(BuildContext context) {
    var itemTile = new ListTile(
      title: new Text("$_todoName"),
    );

    bool complete = false;
    bool reviewFlag = false;
    var rules;

    @override
    void initState() {
      super.initState();
      ReviewService().getLatestRules('').then((QuerySnapshot docs) {
        if (docs.documents.isNotEmpty) {
          reviewFlag = true;
          rules = docs.documents[0].data;
        }
      });
    }

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
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Admin',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('View',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(140.0, 167.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    )
                  ],
                ),
              ),
              itemTile,
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}

class todo {
  final String key;
  String name;

  todo.fromJson(this.key, Map data) {
    name = data['name'];
    if (name == null) {
      name = '';
    }
  }
}
