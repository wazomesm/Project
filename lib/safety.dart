import 'package:flutter/material.dart';
import 'Auth/auth.dart';

class CustomLocateMenu extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: [
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
                      padding: EdgeInsets.fromLTRB(16.0, 70.0, 0.0, 0.0),
                      child: Text('Safety',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(180.0, 62.0, 0.0, 0.0),
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
                    Navigator.of(context).pushNamed('/locate');
                  },
                  leading: CircleAvatar(

                      //backgroundImage: AssetImage('assets/stand.jpg'),
                      ),

                  //
                  title: Text('Accident Data',
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
                    Navigator.of(context).pushNamed('/rules');
                  },
                  leading: CircleAvatar(

                      //backgroundImage: AssetImage('assets/stand.jpg'),
                      ),

                  //
                  title: Text('Kenya Road Safety Regulations',
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
                  title: Text('Emergency Contacts',
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
