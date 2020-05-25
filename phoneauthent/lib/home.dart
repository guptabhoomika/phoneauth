import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'honeold.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  final String phnnum;
  final String id;

  HomePage({Key key, @required this.user,this.phnnum,this.id})
      : assert(user != null),
        super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController _name,_email;
    @override
  void initState() {
    _name = TextEditingController();
    _email =TextEditingController();
    

   

  
    // TODO: implement initState
    super.initState();
  }
_makePostRequest() async {
  // set up POST request arguments
  String url = 'http://ec2-13-232-236-5.ap-south-1.compute.amazonaws.com:3000/api/users/';
  Map<String, String> headers = {"Content-type": "application/json"};
  //in corrospondence to the old apis
   String json = jsonEncode({
			"name" : _name.text,
      "email" : _email.text,
      "phone" : widget.phnnum,
      "token_id" : widget.id,
      "time_stamp" : Timestamp.now().toString(),
      "add1":" ",
      "add2":" ",
      "lanmark":" ",
      "city":" ",
      "pincode":" ",
      "pass_code":" "
      
 

});
  // make POST request
  http.Response response = await http.post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  print(response.body);
  // this API passes back the id of the new item added to the body
 print(statusCode);
 if(statusCode == 200)
 {
   //navigate to home old
   //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeOld()));
 }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text("Create Account",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text("Sign up to get started!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                ],
              ),
               SizedBox(height: 30,),
              Column(
                children: <Widget>[
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      //floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      //floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    
                  ),
                  // SizedBox(height: 16,),
                  // TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: "Password",
                  //     labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.grey.shade300),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.red),
                  //     ),
                  //     //floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   ),
                  // ),
                  // SizedBox(height: 16,),
                  //  TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: "Address Line 1",
                  //     labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.grey.shade300),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.red),
                  //     ),
                  //     //floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   ),
                  // ),
                  // SizedBox(height: 16,),
                  //  TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: "Address Line 2",
                  //     labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.grey.shade300),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.red),
                  //     ),
                  //     //floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   ),
                  // ),
                  // SizedBox(height: 16,),
                  //  TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: "Landmark",
                  //     labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.grey.shade300),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.red),
                  //     ),
                  //     //floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   ),
                  // ),
                  //   SizedBox(height: 16,),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: "City",
                  //     labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.grey.shade300),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.red),
                  //     ),
                  //     //floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   ),
                    
                  // ),
                  //   SizedBox(height: 16,),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: "Pincode",
                  //     labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.grey.shade300),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(color: Colors.red),
                  //     ),
                  //     //floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   ),
                    
                  // ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: (){
                        _makePostRequest();
                      },
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffff5f6d),
                              Color(0xffff5f6d),
                              Color(0xffffc371),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                          child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: FlatButton(
                  //     onPressed: (){},
                  //     color: Colors.indigo.shade50,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6)
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Image.asset("images/facebook.png",height: 18,width: 18,),
                  //         SizedBox(width: 10,),
                  //         Text("Connect with Facebook",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo),)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 30,),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[z
              //       Text("I'm already a member.",style: TextStyle(fontWeight: FontWeight.bold),),
              //       GestureDetector(
              //         onTap: (){
              //           Navigator.pop(context);
              //         },
              //         child: Text("Sign in.",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
