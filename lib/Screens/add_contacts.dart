import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CheckScreen.dart';

class Contacts {
  final String fname;
  final String lname;
  final List<String> pnums;

  Contacts(this.fname, this.lname, this.pnums);
}

class AddContacts extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  List<Contacts> contacts = [];
  final lnameController = new TextEditingController();
  final fnameController = new TextEditingController();
  final numberController1 = new TextEditingController();
  final numberController2 = new TextEditingController();
  final numberController3 = new TextEditingController();
  List<Contacts> contactsAppend = <Contacts>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Contacts'),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: lnameController,
            decoration: InputDecoration(
                hintText: 'Enter last name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          TextFormField(
            controller: fnameController,
            decoration: InputDecoration(
                hintText: 'Enter first name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          TextFormField(
            controller: numberController1,
            decoration: InputDecoration(
                hintText: 'Enter number',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          TextFormField(
            controller: numberController2,
            decoration: InputDecoration(
                hintText: 'Enter number (2) ',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          TextFormField(
            controller: numberController3,
            decoration: InputDecoration(
                hintText: 'Enter number (3)',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: RaisedButton(
              child: Text(
                'Save Contact',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                List<String> pn = [
                  numberController1.text,
                  numberController2.text,
                  numberController3.text,
                ];
                setState(() {
                  contactsAppend.insert(0, Contacts(fnameController.text, lnameController.text, pn));
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckScreen(todo: contactsAppend)));
              },
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      )),
    );
  }
}

class ShowContacts extends StatelessWidget {
  List<Contacts> contacts;

  ShowContacts({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].fname + ' ' + contacts[index].lname),
            subtitle: Text(
              contacts[index].pnums[0] +
                  '   ' +
                  contacts[index].pnums[1] +
                  '   ' +
                  contacts[index].pnums[2],
            ),
          );
        },
      ),
    );
  }
}
