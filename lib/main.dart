import 'package:flutter/material.dart';
import 'Screens/add_contacts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Database',
      theme: ThemeData(
        primaryColor: Colors.blue,
          accentColor: Colors.blue,
      ),
      home: AddContacts(),
    );
  }

}



