import 'package:blink_basket/modal/user_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../helper/User_Data_helper.dart';

class UserController extends ChangeNotifier {
  List<User> allUserData = [];

  Logger logger = Logger();

  UserController() {
    initData();
  }

  Future<void> initData() async {
    UserHelper.dbHelper.initDb();
    allUserData = await UserHelper.dbHelper.getAllData();
    notifyListeners();
  }

  void insertData({required User user}) {
    UserHelper.dbHelper.insertData(user: user);
    logger.i(allUserData);
    initData();
  }

  void DeleteData({required int id}) {
    UserHelper.dbHelper.deleteData(id: id);
    logger.i(allUserData);
    initData();
  }
}
