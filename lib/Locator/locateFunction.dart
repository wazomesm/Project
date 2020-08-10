import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:safe_travel/Auth/auth.dart';
import 'package:safe_travel/Location/locationService.dart';
import 'package:safe_travel/Location/userLocation.dart';

class locateFunc extends StatefulWidget {
  @override
  _locateFuncState createState() => _locateFuncState();
}

@override
class _locateFuncState extends State<locateFunc> {
  final AuthService _auth = AuthService();
  // var userLocation = Provider.of<UserLocation>(context);
  String _locationMessage = '';

  void _getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    setState(() {
      _locationMessage = "${position.latitude},  ${position.longitude}";
    });
  }

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
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Locate',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('Results',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(215.0, 167.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    )
                  ],
                ),
              ),
              Container(
                child: Card(
                  margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  shadowColor: Colors.green,
                  child: ListTile(
                    onTap: () {
                      _getCurrentLocation();
                    },
                    leading: CircleAvatar(
                        child: Icon(
                      Icons.location_on,
                      color: Colors.green,
                    )),

                    //
                    title: Text('Tap to use location',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700)),
                    subtitle: Text(_locationMessage,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
