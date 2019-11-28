
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


  Future<List<Password>> getList(int page) async {
    var path = await CommonSP.getDBPath();
    Database db = await openDatabase(path);
    int end = page * 30;
    int start = (end - 30) > 0 ? (end - 30) : 0;
    String sqlQuery =
        "SELECT * FROM '$tabName' ORDER BY id DESC LIMIT '$start','$end'";
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
}