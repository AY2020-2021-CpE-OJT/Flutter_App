import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/Screens/modify.dart';
import 'add_contacts.dart';

class GetData extends StatefulWidget {

  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final String apiUrlget = "https://pbook-application.herokuapp.com/posts";
  List<dynamic> users = [];


//get
  void fetchContacts() async {
    var result = await http.get(Uri.parse(apiUrlget));
    setState(() {
      users = jsonDecode(result.body);
    });
    print("All Data Fetched");
  }


  String _name(dynamic user) {
    return user['firstname'] + " " + user['lastname'];
  }

  String _phonenum(dynamic user) {
    return "First Number: " + user['phonenumbers'][0] + "\n" + "Second Number: " + user['phonenumbers'][1] + "\n"
        + "Third Number: " + user['phonenumbers'][2];
  }
  @override
  void initState() {
    super.initState();
    fetchContacts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contacts"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddContacts()));
        },


      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          builder: (context, snapshot) {
            int count = 0;
            return ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemCount: count = users.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          _name(users[index]),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(_phonenum(users[index])),
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Modify(contactID: '',)));
                        }
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
