import 'package:flutter/material.dart';
import 'package:password_manager/password.dart';
import 'squtils.dart';

class LoginPage extends StatefulWidget {

  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage>{
  String _string = "test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            Text(_string),
            GestureDetector(
              child: Text("Text"),
              onTap: insert,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SQUtils.origin.init();
  }

  void insert(){
    SQUtils.origin.insert(Password("password","123","123","123456")).then((onValue){
      SQUtils.origin.getList(1).then((onValue){
        setState(() {
          _string = onValue.first.name;
        });
      });
    });
  }
}