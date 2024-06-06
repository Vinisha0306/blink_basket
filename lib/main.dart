import 'package:blink_basket/app.dart';
import 'package:blink_basket/controller/ApiController.dart';
import 'package:blink_basket/controller/UserController.dart';
import 'package:blink_basket/helper/User_Data_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserHelper.dbHelper.initDb();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
