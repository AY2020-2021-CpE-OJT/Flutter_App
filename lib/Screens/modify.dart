import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modify extends StatelessWidget {

  final String contactID;


  Modify({required this.contactID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Modify Contacts"),
      ),

    );
  }
}
