
import 'dart:math';

import 'package:password_manager/password.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'sp_local.dart';
class SQUtils {
  static final SQUtils origin = SQUtils();
  Database db;
  String dbPath;
  String dbName = 'password.db';
  static String tabName = 'password_table';
  String sqlCreateTable =
      "CREATE TABLE '$tabName' (id INTEGER PRIMARY KEY, name TEXT,url TEXT,type TEXT,password TEXT,icon TEXT,star INTEGER)";
  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = prefs.getString('password_db_path');
    if (json == null) {
      var databasesPath = await getDatabasesPath();
      dbPath = join(databasesPath, dbName);
      CommonSP.saveDBPath(dbPath);
      Database db = await openDatabase(dbPath);

      await db.execute(sqlCreateTable);
//      await db.close();
      print('创建password.db成功，创建password_table成功');
    }
  }

  Future insert(Password mic) async {
    var path = await CommonSP.getDBPath();

    Database db = await openDatabase(path);

    await db.transaction((txn) async {
      if(mic.id!=null){
        var _id = mic.id;
        var _name = mic.name;
        var _url = mic.url;
        var _type = mic.type;
        var _password = mic.password;
        var _icon = mic.icon;
        var _star = mic.star;
        String sql = " REPLACE INTO '$tabName'"
            "(id,name,url,type,password,icon,star)"
            " VALUES('$_id','$_name','$_url','$_type','$_password','$_icon','$_star')";
        await txn.rawInsert(sql);
      }else{
          var _name = mic.name;
          var _url = mic.url;
          var _type = mic.type;
          var _password = mic.password;
          var _icon = mic.icon;
          var _star = mic.star;
          String sql = " REPLACE INTO '$tabName'"
              "(name,url,type,password,icon,star)"
              " VALUES('$_name','$_url','$_type','$_password','$_icon','$_star')";
          await txn.rawInsert(sql);
      }

    });

  }


  Future<List<Password>> getList(String key) async {
    var path = await CommonSP.getDBPath();
    Database db = await openDatabase(path);
    String sqlQuery;
    if(key.isEmpty){
      sqlQuery =
      "SELECT * FROM '$tabName' WHERE star>=0 ORDER BY id DESC ";
    }else{
      sqlQuery = "SELECT * FROM '$tabName' WHERE name LIKE '%$key%' OR url LIKE '%$key%' ORDER BY id DESC ";
    }

    print(sqlQuery);
    List<Map> list = [];
    try {
      list = await db.rawQuery(sqlQuery);
    } catch (exception) {
      print(exception.toString());
    }

    print(list);
//    await db.close();
    return list.map((model) {
      return new Password.fromJson(model);
    }).toList();
  }

  Future<Password> getSingle(int id) async{
    try {
      String path = await CommonSP.getDBPath();
      Database db = await openDatabase(path);
      String sql_query = "SELECT * FROM '$tabName' WHERE ID= '$id'";
      List<Map> list = await db.rawQuery(sql_query);
      if (list != null) {
        print(list);
      }
      return new Password.fromMap(list[0]);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<int> delete(int id) async {
    try {
      String path = await CommonSP.getDBPath();
      Database db = await openDatabase(path);
      String sql_query = "DELETE FROM '$tabName' WHERE ID= '$id'";
      int i = await db.rawDelete(sql_query);
      print('delete ' + '$i');
      return i;
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}