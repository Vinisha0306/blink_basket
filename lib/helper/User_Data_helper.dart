import 'package:blink_basket/modal/user_modal.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

enum UserTable { id, name, lastName, email, password }

class UserHelper {
  UserHelper._();

  static UserHelper dbHelper = UserHelper._();

  Logger logger = Logger();
  String sql = '';
  String dbName = "my_dataBase";
  String tableName = "BasketUserTable";

  late Database database;

  Future<void> initDb() async {
    String path = await getDatabasesPath();

    database = await openDatabase(
      "$path/$tableName",
      version: 2,
      onCreate: (db, version) {
        String query =
            """create table if not exists $tableName (${UserTable.id.name} integer primary key autoincrement,
                          ${UserTable.name.name} text not null,
                          ${UserTable.lastName.name} text,
                          ${UserTable.email.name} text
                          ${UserTable.password.name} text
                          )""";

        db
            .execute(query)
            .then(
              (value) => logger.i("Table Create successfully"),
            )
            .onError(
              (error, stackTrace) => logger.e("ERROR : $error"),
            );
      },
      onUpgrade: (db, v1, v2) {
        String query =
            """create table if not exists $tableName (${UserTable.id.name} integer primary key autoincrement,
                          ${UserTable.name.name} text not null,
                          ${UserTable.lastName.name} text,
                          ${UserTable.email.name} text
                          ${UserTable.password.name} text
                          )""";

        db
            .execute(query)
            .then(
              (value) => logger.i("Table Create successfully"),
            )
            .onError(
              (error, stackTrace) => logger.e("ERROR : $error"),
            );
      },
    );
  }

  Future<void> insertData({required User user}) async {
    sql =
        "insert into $tableName(name,lastName,email,password) values(?,?,?,?);";
    List args = [
      user.name,
      user.lastName,
      user.email,
      user.password,
    ];
    await database.rawInsert(sql, args);
  }

  Future<List<User>> getAllData() async {
    List<User> allUserData = [];

    sql = "select * from $tableName;";
    List Data = await database.rawQuery(sql);
    allUserData = Data.map((e) => User.fromJson(e)).toList();

    return allUserData;
  }

  Future<void> deleteData({required int id}) async {
    await database
        .delete(
          tableName,
          where: "id=?",
          whereArgs: [id],
        )
        .then(
          (value) => logger.i('Deleted'),
        )
        .onError(
          (error, stackTrace) => logger.e('Error : $error'),
        );
  }
}
