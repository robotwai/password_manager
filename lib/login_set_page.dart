import 'package:flutter/material.dart';
class LoginSetPage extends StatefulWidget{

  @override
  State createState() {
    return LoginSetState();
  }
}

class LoginSetState extends State<LoginSetPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置密码"),
      ),
    );
  }
}