import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'app.dart';
class HomeOld extends StatefulWidget {
  final FirebaseUser user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  HomeOld({Key key, this.user})
      : assert(user != null),
        super(key: key);
  @override
  _HomeOldState createState() => _HomeOldState();
}

class _HomeOldState extends State<HomeOld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Sign out old user"),
            onPressed: () {
             
            },
          ),
          Center(
            child: Text(widget.user.phoneNumber),
          ),
        ],
      ),
    );
  }
}
