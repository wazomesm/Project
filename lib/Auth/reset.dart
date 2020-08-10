import 'package:flutter/material.dart';
import 'package:safe_travel/Auth/auth.dart';

class ResetPass1 extends StatefulWidget {
  @override
  _ResetPass1State createState() => new _ResetPass1State();
}

class _ResetPass1State extends State<ResetPass1> {
  //for validation
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String err = '';
  String message = '';

  @override
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
                        child: Text('Reset',
                            style: TextStyle(
                                fontSize: 60.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                        child: Text('Password',
                            style: TextStyle(
                                fontSize: 60.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(275.0, 150.0, 0.0, 0.0),
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
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter An Email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              height: 40.0,
                              child: GestureDetector(
                                onTap: () async {
                                  if (_formkey.currentState.validate()) {
                                    dynamic result = await _auth
                                        .sendPasswordResetEmail(email);

                                    if (result == null) {
                                      setState(() => message =
                                          'A reset link has been sent to $email ');
                                    }
                                  }

                                  //Navigator.of(context).pushNamed('/home');
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  child: Center(
                                    child: Text(
                                      'Reset My Password',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ))),
              ],
            ),
          ],
        ));
  }
}
