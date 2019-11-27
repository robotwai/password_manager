
import 'package:flutter/material.dart';
import 'package:password_manager/main_search_page.dart';
import 'squtils.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  double showIndSize = 12.0;

  double numSize = 60.0;

  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/login.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitWidth,
          ),
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "请输入密码",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60.0, right: 60.0, top: 20.0),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Container(
                          color:
                              password.length > 0 ? Colors.blue : Colors.grey,
                          width: showIndSize,
                          height: showIndSize,
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          color:
                              password.length > 1 ? Colors.blue : Colors.grey,
                          width: showIndSize,
                          height: showIndSize,
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          color:
                              password.length > 2 ? Colors.blue : Colors.grey,
                          width: showIndSize,
                          height: showIndSize,
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          color:
                              password.length > 3 ? Colors.blue : Colors.grey,
                          width: showIndSize,
                          height: showIndSize,
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          color:
                              password.length > 4 ? Colors.blue : Colors.grey,
                          width: showIndSize,
                          height: showIndSize,
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          color:
                              password.length > 5 ? Colors.blue : Colors.grey,
                          width: showIndSize,
                          height: showIndSize,
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
                getNum(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "忘记密码",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                      onTap: forget,
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "清除",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                      onTap: clearNum,
                    )
                  ],
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }

  Widget getNum() {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(1);
                    }),
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(2);
                    }),
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(3);
                    }),
              ],
            ),
            margin: EdgeInsets.only(top: 30.0),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(4);
                    }),
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(5);
                    }),
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "6",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(6);
                    }),
              ],
            ),
            margin: EdgeInsets.only(top: 30.0),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "7",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(7);
                    }),
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "8",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(8);
                    }),
                GestureDetector(
                    child: Container(
                      width: numSize,
                      height: numSize,
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(numSize)),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          "9",
                          style: TextStyle(
                              color: Colors.white, fontSize: numSize / 2),
                        ),
                      ),
                    ),
                    onTap: () {
                      tapNum(9);
                    }),
              ],
            ),
            margin: EdgeInsets.only(top: 30.0),
          ),
          Container(
            child: GestureDetector(
                child: Container(
                  width: numSize,
                  height: numSize,
                  decoration: new BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(numSize)),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Center(
                    child: Text(
                      "0",
                      style:
                          TextStyle(color: Colors.white, fontSize: numSize / 2),
                    ),
                  ),
                ),
                onTap: () {
                  tapNum(0);
                }),
            margin: EdgeInsets.only(top: 30.0),
          ),
        ],
      ),
    );
  }



  tapNum(int num) {
    print(num.toString());
    password = password + "$num";
    setState(() {});
    if (password.length == 6) {
      submit();
    }
  }

  submit() {
    if (password == "123456") {
      Navigator.pushReplacementNamed(context,'/a');
      print("成功");
    } else {
      print("失败");
    }
    setState(() {
      password = "";
    });
  }

  clearNum() {
    password = "";
    setState(() {});
  }

  forget() {}
  @override
  void initState() {
    super.initState();
    SQUtils.origin.init();
  }
}
