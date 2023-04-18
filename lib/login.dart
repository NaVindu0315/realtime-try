import 'package:flutter/material.dart';
import 'package:mekwathwadakrnna/send.dart';

import 'main.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(lgin());
}

class lgin extends StatefulWidget {
  static String id = 'loginscreen';

  @override
  State<lgin> createState() => _lginState();
}

class _lginState extends State<lgin> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController pwcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;
  late String email;
  late String pw;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple.shade100,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple.shade200,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Gemifyy', // Add this new Text widget
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3F3D56),
                      ),
                    ),
                  ),
                  SizedBox(height: 5), // Add this SizedBox widget
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3D56),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 70,
                    width: 350, // Set the width of the SizedBox to 300 pixels
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: emailcontroller,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 70,
                    width: 350, // Set the width of the SizedBox to 300 pixels
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: pwcontroller,
                        onChanged: (value) {
                          pw = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 350,
                      height: 50,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: ElevatedButton(
                        onPressed: () async {
                          emailcontroller.clear();
                          pwcontroller.clear();
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: pw);

                            if (user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SendDataPage()),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //to add social media icons
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
