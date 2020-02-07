import 'package:flutter/material.dart';
import 'MyHome.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"WinMoney",
      theme:ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}