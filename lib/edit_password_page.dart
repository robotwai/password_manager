
import 'package:flutter/material.dart';

class EditPasswordPage extends StatefulWidget{
  final String title;

  EditPasswordPage(this.title);

  @override
  EditPasswordState createState() {
    return EditPasswordState(title);
  }
}

class EditPasswordState extends State<EditPasswordPage>{
  String title;

  EditPasswordState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}