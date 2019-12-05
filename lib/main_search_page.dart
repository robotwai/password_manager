import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/constants.dart';
import 'package:password_manager/edit_password_page.dart';
import 'package:password_manager/squtils.dart';
import 'password.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MainSearchPage extends StatefulWidget {
  @override
  MainSearchState createState() {
    return MainSearchState();
  }
}

class MainSearchState extends State<MainSearchPage> {
  List<Password> datas = [];
  String _key = "";
  TextEditingController _controller = new TextEditingController();

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
        onPressed: () {
          _addPassword(0);
        },
        tooltip: '新增密码',
        child: new Icon(Icons.add),
      ),
    );
  }

  _addPassword(int id) {
    Navigator.of(context)
        .push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new EditPasswordPage(id);
      },
    ))
        .then((onValue) {
      if (onValue == 1) {
        _controller.text = "";
        _key = "";
        getData();
      }
    });
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
        border:
            new Border.all(width: 1, color: Constants.primaryColor.shade300),
      ),
      child: Center(child: Row(
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
              controller: _controller,
              maxLines: 1,
              decoration: new InputDecoration(
                hintText: '请输入关键字',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
            ),
          )
        ],
      ),),
    );
  }

  void _onTextChange(String text) {
    _key = text;
    getData();
  }

  Widget _buildRow(BuildContext context, int index) {
    if (datas.length == 0) {
      return Container(
        height: 200,
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
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  color: Colors.white70,
                  child: Center(
                    child: Text(
                      item.url.substring(0, 1),
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
        onLongPress: () {
          _showEdit(item);
        },
      );
    }
  }

  _showPassword(Password password) {
    showModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return OrientationBuilder(builder: (context, orientation) {
            return Container(
              child: orientation == Orientation.portrait
                  ? Column(
                      children: <Widget>[
                        showNumPassword(password),
                        showQR(password)
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        showNumPassword(password),
                        showQR(password)
                      ],
                    ),
            );
          });
        });
  }

  Widget showQR(Password password) {
    return QrImage(
      data: "url:" +
          password.url +
          " username:" +
          password.name +
          " password:" +
          password.password,
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  Widget showNumPassword(Password password) {
    return SimpleDialog(
      title: const Text('密码详情'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: password.url));
            Fluttertoast.showToast(msg: "帐号复制成功");
          },
          child: Row(
            children: <Widget>[Text("帐号："), Text(password.name)],
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: password.password));
            Fluttertoast.showToast(msg: "密码复制成功");
          },
          child: Row(
            children: <Widget>[Text("密码："), Text(password.password)],
          ),
        ),
      ],
    );
  }

  void _showEdit(Password item) {
    showModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              height: 121.0,
              child: new Column(
                children: <Widget>[
                  new GestureDetector(
                    child: new Container(
                      child: new Text(
                        '编辑',
                        style: new TextStyle(
                            color: Colors.black87, fontSize: 14.0),
                      ),
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: Color(0xffffffff),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      _addPassword(item.id);
                    },
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                    child: new Divider(
                      height: 1.0,
                    ),
                  ),
                  new GestureDetector(
                    child: new Container(
                      child: new Text(
                        '删除',
                        style: new TextStyle(
                            color: Colors.redAccent, fontSize: 14.0),
                      ),
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: Color(0xffffffff),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      deletePassword(item);
                    },
                  ),
                ],
              ));
        });
  }

  Future<void> deletePassword(Password item) async {
    String _name = item.name;
    String _password = item.password;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('确认你的操作'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("你将删除帐号为：$_name 密码是$_password"),
                Text(
                  '你的操作不可逆，密码会直接删除，没有同步',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                '删除',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                SQUtils.origin.delete(item.id).then((onValue) {
                  Fluttertoast.showToast(msg: "删除成功");
                  getData();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    SQUtils.origin.getList(_key).then((onValue) {
      datas = onValue;
      setState(() {});
    });
  }
}
