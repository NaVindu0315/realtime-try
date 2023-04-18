import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RetrieveDataPage extends StatefulWidget {
  @override
  _RetrieveDataPageState createState() => _RetrieveDataPageState();
}

class _RetrieveDataPageState extends State<RetrieveDataPage> {
  late DatabaseReference _databaseReference;
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref().child('name');
    _databaseReference.onChildAdded.listen((event) {
      setState(() {
        _messages.add(event.snapshot.value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Data'),
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_messages[index]),
          );
        },
      ),
    );
  }
}
