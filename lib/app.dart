import 'package:blink_basket/pages/home_page/home_page.dart';
import 'package:blink_basket/pages/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff0A1D56),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
