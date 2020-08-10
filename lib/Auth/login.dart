import 'package:flutter/material.dart';
import 'package:safe_travel/Auth/auth.dart';

class ULogin extends StatefulWidget {
  @override
  _ULoginState createState() => new _ULoginState();
}

class _ULoginState extends State<ULogin> {
  //for validation
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String err = '';

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
                        padding: EdgeInsets.fromLTRB(232.0, 167.0, 0.0, 0.0),
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
                            SizedBox(height: 20.0),
                            TextFormField(
                              validator: (val) => val.length < 8
                                  ? 'Enter A Password 8+ Characters Long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              obscureText: true,
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              alignment: Alignment(1.0, 0.0),
                              padding: EdgeInsets.only(top: 15.0, left: 20.0),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              height: 40.0,
                              child: GestureDetector(
                                onTap: () async {
                                  if (_formkey.currentState.validate()) {
                                    dynamic result = await _auth
                                        .signinemailpass(email, password);
                                    if (result == null) {
                                      setState(() => err =
                                          'Please check that all forms are filled properly');
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
                                      'LOGIN',
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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New Here?  ',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ],
        ));
  }
}
