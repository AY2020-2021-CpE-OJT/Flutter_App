import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'GetData.dart';
import 'add_contacts.dart';

class CheckScreen extends StatelessWidget {
  final List<Contacts> todo;

  const CheckScreen({Key? key, required this.todo}) : super(key: key);

  //Post

  @override
  Widget build(BuildContext context) {
    final List<String> strHold = <String>[];
    Future<http.Response> createAlbum(String fname, String lname, List pnums) {
      return http.post(
        Uri.parse('https://pbook-application.herokuapp.com/posts/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'phonenumbers': pnums,
          'firstname': fname,
          'lastname': lname,
        }),
      );
    }

    //User INTERFACE

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              createAlbum(
                  todo[index].fname, todo[index].lname, todo[index].pnums);
              return Container(
                child: Column(
                  children: <Widget>[
                    Text('\n\nContact Added',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                    Text(
                        '\n\nFirst Name: ${todo[index].fname} \n\nLast Name: ${todo[index].lname} \n\nNumber/s:',
                        style:
                            TextStyle(color: Colors.black, fontSize: 24)),
                    for (var strHold in todo[index].pnums)
                      Text('\n' + strHold,
                          style: TextStyle(
                              color: Colors.black, fontSize: 20)),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        child: new Text(
                          "Done",
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetData()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(20)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
