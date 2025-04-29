import 'package:flutter/material.dart';
import 'pages/signup_pg.dart';
import 'pages/welcome_pg.dart';
import 'pages/about_us_pg.dart';
import 'models/user.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Lab 3 App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpPage(),
        '/welcome': (context) => WelcomePage(),
        '/about': (context) => AboutUsPage(),
      },
    ),
  );
}
