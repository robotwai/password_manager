import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/constants.dart';
import 'package:password_manager/password.dart';
import 'package:password_manager/squtils.dart';

class EditPasswordPage extends StatefulWidget {
  final int id;

  EditPasswordPage(this.id);

  @override
  EditPasswordState createState() {
    return EditPasswordState(id);
  }
}

class EditPasswordState extends State<EditPasswordPage> {
  int id;
  EditPasswordState(this.id);
  bool _hide = false;

  String _url = "";
  String _password = "";
  String _username = "";
  TextEditingController _urlController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          id == 0 ? "新增密码" : "编辑密码",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                child: TextField(
                  onChanged: (str) {
                    _url = str;
                  },
                  controller: _urlController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '请输入App名称或网站名称',
                      labelStyle: TextStyle(fontSize: 12.0)),
                ),
                height: 44.0,
              ),
              Container(
                child: TextField(
                  onChanged: (str) {
                    _username = str;
                  },
                  controller: _usernameController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '请输入登录用户名',
                      labelStyle: TextStyle(fontSize: 12.0)),
                ),
                height: 44.0,
                margin: EdgeInsets.only(top: 20),
              ),
              Container(
                child: TextField(
                  onChanged: (str) {
                    _password = str;
                  },
                  controller: _passwordController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '请输入密码',
                      labelStyle: TextStyle(fontSize: 12.0)),
                ),
                height: 44.0,
                margin: EdgeInsets.only(top: 20),
              ),
              Container(
                height: 44.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("仅支持搜索"),
                    Container(
                      width: 100.0,
                      child: SwitchListTile(
                        dense: true,
                        value: _hide,
                        onChanged: (bool value) {
                          setState(() {
                            _hide = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                margin: EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        width: MediaQuery.of(context).size.width,
        height: 48.0,
        alignment: Alignment.centerRight,
        child: new Container(
          margin: const EdgeInsets.only(right: 14.0),
          child: new Material(
            borderRadius: BorderRadius.circular(24.0),
            child: new RaisedButton(
              onPressed: () {
                onPressed();
              },
              child: new Text('保存',
                  style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  maxLines: 1),
              color: Constants.primaryColor.shade700,
              elevation: 0.0,
            ),
          ),
          height: 40.0,
          width: 90.0,
        ),
      ),
      resizeToAvoidBottomPadding: true,
    );
  }

  void onPressed() {
    if (_url == "" || _password == "" || _username == "") {
      Fluttertoast.showToast(msg: "请确认输入信息完整");
      return;
    }
    SQUtils.origin
        .insert(id != 0
            ? Password.name(
                id, _username, _url, "", _password, "", _hide ? -1 : 0)
            : Password(_username, _url, "", _password, "", _hide ? -1 : 0))
        .then((onValue) {
      Fluttertoast.showToast(msg: "密码添加成功");
      Navigator.of(context).pop(1);
    });
  }

  @override
  void initState() {
    super.initState();
    SQUtils.origin.getSingle(id).then((onValue) {
      if (onValue != null) {
        _urlController.text = onValue.url;
        _url = onValue.url;
        _usernameController.text = onValue.name;
        _username = onValue.name;
        _passwordController.text = onValue.password;
        _password = onValue.password;
        _hide = onValue.star == -1;
        setState(() {});
      }
    });
  }
}
