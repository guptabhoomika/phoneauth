import 'package:phoneauthent/phone_auth.dart';



import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.redAccent,
      //   image: DecorationImage(
      //     colorFilter: new ColorFilter.mode(
      //         Colors.black.withOpacity(0.1), BlendMode.dstATop),
      //     image: AssetImage('assets/images/mountains.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      ),
      child: new Column(
        children: <Widget>[
          //for logo
          Container(
            padding: EdgeInsets.only(top: 250.0),
            // child: Center(
            //   child: ImageIcon(
            //     AssetImage(" "),
            //     color: Colors.blue,
            //     size: 80.0,
            //   ),
            // ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Kitchen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  "Mart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
              ),
              SizedBox(height: 150,),
              Text("Connect with us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
              PhoneLogin()
        ]
      )
    );

  }
}
