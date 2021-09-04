import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      routes: {
      "/": (context)=> LoginPage(),
        "home":(context)=>HomePage(),
        "/login":(context)=> LoginPage(),

      },
    );
  }
}




