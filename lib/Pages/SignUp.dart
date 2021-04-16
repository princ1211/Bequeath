import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;



  @override
  void initState() {
    super.initState();

  }


  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height*0.5,
                  width: size.width,
                  child: Image(
                    image: AssetImage("Images/imag.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Column(
                    children: [

                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                  validator: (input) {
                                    if (input.isEmpty) return 'Enter Name';
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  onSaved: (input) => _name = input),
                            ),
                            Container(
                              child: TextFormField(
                                  validator: (input) {
                                    if (input.isEmpty) return 'Enter Email';
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email)),
                                  onSaved: (input) => _email = input),
                            ),
                            Container(
                              child: TextFormField(
                                  validator: (input) {
                                    if (input.length < 6)
                                      return 'Provide Minimum 6 Character';
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  obscureText: true,
                                  onSaved: (input) => _password = input),
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                              onPressed: (){},
                              child: Text('SignUp',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}