import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mekwathwadakrnna/view.dart';

class SendDataPage extends StatefulWidget {
  @override
  _SendDataPageState createState() => _SendDataPageState();
}

class _SendDataPageState extends State<SendDataPage> {
  //late DatabaseReference dbref;
  late String sendmsg;
  final TextEditingController _textEditingController = TextEditingController();
  //late DatabaseReference dbref;
  late DatabaseReference dbref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('name');
  }

  Future<void> addData(String msg) async {
    await dbref.push().set(msg);
  }

  Future<void> adduser() async {
    // await _firestore.collection('userdetails').add({'email': email, 'pw': pw});
    await FirebaseFirestore.instance.collection('users').doc('nn').set({
      'username': 'navindu',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter a message",
              ),
              onChanged: (value) {
                sendmsg = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              /* Map<String, String> student = {'name': sendmsg};
              dbref.push().set(student);*/
              // addData();
              //adduser();
              // adddata(sendmsg);
              addData(sendmsg);
            },
            child: Text("Send"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RetrieveDataPage()),
              );
            },
            child: Text("view"),
          ),
        ],
      ),
    );
  }
}
