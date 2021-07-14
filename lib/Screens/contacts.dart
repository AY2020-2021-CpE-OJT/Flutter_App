import 'package:flutter/material.dart';

import 'add_contacts.dart';


class Contacts extends StatelessWidget {
  final lname,fname,num;
  Contacts({@required this.lname, this.fname, this.num});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('My Contacts'),
      ),




      //contact list


      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return AddContacts();
        }));
      },
          child: Icon(Icons.add,color: Colors.white,)

      ),
    );
  }
  }
