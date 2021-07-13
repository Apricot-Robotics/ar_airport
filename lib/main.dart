import 'package:flutter/material.dart';
import 'home.dart';
import 'restaurant_page.dart';
import 'gate_page.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      // },
    );
  }
}


