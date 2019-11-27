import 'dart:math';

import 'package:flutter/material.dart';
import 'package:password_manager/squtils.dart';
import 'password.dart';
class MainSearchPage extends StatefulWidget {
  @override
  MainSearchState createState() {
    return MainSearchState();
  }
}

class MainSearchState extends State<MainSearchPage> {
  List<Password> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: new AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: new Text(
              "我的密码本",
              style: new TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            elevation: 0.0,
          ),
          body: Container(
            color: Colors.white,
            child: buildList(),
          ),
          floatingActionButton:  FloatingActionButton(
            onPressed: _addPassword,
            tooltip: '新增密码',
            child: new Icon(Icons.add),
          ),
        );

  }
  int num = 0;
  void _addPassword(){
    num ++;
    SQUtils.origin.insert(Password(num.toString(),"url","t","p")).then((onValue){
      getData();
    });
  }

  Widget buildList(){
    var content;
    content = new ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: datas.length == 0 ? 1 : datas.length,
      primary: true,
      itemBuilder: _buildRow,
    );
    return content;
  }

  Widget _buildRow(BuildContext context, int index){
    if(datas.length==0){
      return Container(
        child: Center(
          child: Text("还没有保存密码"),
        ),
      );
    }else{
      final Password item = datas[index];
      return new GestureDetector(
        child: new Card(
          color: Colors.amberAccent,
          margin: const EdgeInsets.all(10.0),
          child: new Text(item.name),
        ),
        onTap: () {

        },
      );
    }
  }
  int _lastClickTime;
  Future<bool> _doubleExit() {
    int nowTime = new DateTime.now().microsecondsSinceEpoch;

    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return new Future.value(true);
    } else {
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      new Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      return new Future.value(false);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData(){
    SQUtils.origin.getList(1).then((onValue){
      datas = onValue;
      setState(() {

      });
    });
  }
}
