import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/edit_password_page.dart';
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
      appBar: new PreferredSize(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        child: buildSearch(),
        preferredSize: Size(MediaQuery.of(context).size.width, 40.0),
      ),
      body: Container(
        color: Colors.white10,
        child: buildList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPassword,
        tooltip: '新增密码',
        child: new Icon(Icons.add),
      ),
    );
  }


  void _addPassword() {

    Navigator.of(context)
        .push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new EditPasswordPage("新增密码");
      },
    ));
  }

  Widget buildList() {
    var content;
    content = new ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: datas.length == 0 ? 1 : datas.length,
      primary: true,
      itemBuilder: _buildRow,
    );
    return content;
  }

  Widget buildSearch() {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 44.0,
      padding: EdgeInsets.only(left: 10.0),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//      color: Colors.transparent,
      decoration: BoxDecoration(
        //背景
        color: Colors.transparent,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.blueAccent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
          ),
          Container(
            height: 44.0,
            width: MediaQuery.of(context).size.width - 20 - 10 - 2,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              onChanged: (text) {
                _onTextChange(text);
              },
              maxLines: 1,
              decoration: new InputDecoration(
                hintText: '请输入关键字',
                border:
                    UnderlineInputBorder(borderSide: BorderSide(width: 0.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.0, color: Colors.white10)),
              ),
              keyboardType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }

  void _onTextChange(String text) {}

  Widget _buildRow(BuildContext context, int index) {
    if (datas.length == 0) {
      return Container(
        child: Center(
          child: Text("还没有保存密码"),
        ),
      );
    } else {
      final Password item = datas[index];
      return new GestureDetector(
        child: new Card(
          color: Colors.white,
          margin: const EdgeInsets.all(6.0),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.white70,
                  child: Center(
                    child: Text(
                      item.name.substring(0, 1),
                      style: TextStyle(color: Colors.blue, fontSize: 16.0),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.url,
                      style: TextStyle(color: Colors.black87, fontSize: 14.0),
                    ),
                    Text(
                      item.name,
                      style: TextStyle(color: Colors.black87, fontSize: 14.0),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          _showPassword(item);
        },
      );
    }
  }

  _showPassword(Password password) async {
    await showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('密码详情'),
            children: <Widget>[
              SimpleDialogOption(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: password.name));
                Fluttertoast.showToast(msg: "帐号复制成功");
              },
                child: Row(
                  children: <Widget>[
                    Text("帐号："),
                    Text(password.name)
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: password.password));
                  Fluttertoast.showToast(msg: "密码复制成功");
                },
                child: Row(
                  children: <Widget>[
                    Text("密码："),
                    Text(password.password)
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    SQUtils.origin.getList(1).then((onValue) {
      datas = onValue;
      setState(() {});
    });
  }
}
