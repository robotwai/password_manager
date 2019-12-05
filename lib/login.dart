
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/constants.dart';
import 'package:password_manager/sp_local.dart';
import 'package:vibration/vibration.dart';
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
  String password1 = "";
  String title ="请输入密码";

  static const String pTitle1 = "请设置密码";
  static const String pTitle2 = "请再次确认密码";
  static const String pTitle3 = "请输入密码";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      title,
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
                            password.length > 0 ? Constants.primaryColor.shade700 : Colors.white,
                            width: showIndSize,
                            height: showIndSize,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color:
                            password.length > 1 ? Constants.primaryColor.shade700 : Colors.white,
                            width: showIndSize,
                            height: showIndSize,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color:
                            password.length > 2 ? Constants.primaryColor.shade700 : Colors.white,
                            width: showIndSize,
                            height: showIndSize,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color:
                            password.length > 3 ? Constants.primaryColor.shade700 : Colors.white,
                            width: showIndSize,
                            height: showIndSize,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color:
                            password.length > 4 ? Constants.primaryColor.shade700 : Colors.white,
                            width: showIndSize,
                            height: showIndSize,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color:
                            password.length > 5 ? Constants.primaryColor.shade700 : Colors.white,
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
                      Offstage(
                        child: GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
                            child: Text(
                              "忘记密码",
                              style: TextStyle(fontSize: 14.0, color: Colors.white),
                            ),
                          ),
                          onTap: forget,
                        ),
                        offstage: title!=pTitle3,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
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
    }else{
      if(vib){
        Vibration.vibrate(duration: 50,);
      }
    }
  }

  submit() async{

    switch(title){
      case pTitle1:
        password1 = password;
        title = pTitle2;
        setState(() { password="";});
        break;
      case pTitle2:
        if(password==password1){
          CommonSP.savePassword(password).then((onValue){
            Fluttertoast.showToast(msg: "设置成功");
            title = pTitle3;
            password ="";
            setState(() {});
          });
        }else{
          Fluttertoast.showToast(msg: "两次密码输入不同,请重新输入密码");
          title = pTitle1;
          password ="";
          setState(() {});
        }
        break;
      case pTitle3:
        if (password == await CommonSP.getPassword()) {
          Navigator.pushReplacementNamed(context,'/a');
          Vibration.vibrate(duration: 100);
        } else {
          Vibration.vibrate(duration: 400);
          password = "";
          title = pTitle3;
          setState(() {});
        }
        break;
    }
  }

  clearNum() {
    password = "";
    setState(() {});
  }

  forget() {
    showForget();
  }
  Future<void> showForget() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('确认你的操作'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("你将删除您之前保存的所以密码"),
                Text('你的操作不可逆，密码会直接删除，没有同步',style: TextStyle(color: Colors.red),),
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
              child: Text('删除',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
                CommonSP.savePassword("").then((v){
                  initPassword();
                });
              },
            ),
          ],
        );
      },
    );
  }

  bool vib = false;
  @override
  void initState() {
    super.initState();
    SQUtils.origin.init();
    Vibration.hasVibrator().then((onValue){
      vib = onValue;
    });
    initPassword();
  }

  void initPassword(){
    CommonSP.getPassword().then((onValue){
      if(onValue != null&&onValue!=""){
        title = pTitle3;
      }else{
        title = pTitle1;
      }
      setState(() {});
    });
  }
}
