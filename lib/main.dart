import 'package:flutter/material.dart';
import 'home.dart';
import 'restaurant_page.dart';
import 'gate_page.dart';
import 'package:roslib/roslib.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

test () async {
  Ros ros = Ros(url: "ws://0.0.0.0:9090");
  ros.connect();
  final cmdVel = Topic(
    ros: ros,
    name: '/cmd_vel',
    type: 'geometry_msgs/Twist',
  );
  final msg = {
    'linear': {'x': 0.1, 'y': 0.2, 'z': 0.3},
    'angular': {'x': -0.1, 'y': -0.2, 'z': -0.3},
  };
  await cmdVel.publish(msg);
}

test2 () async {
  Ros ros = Ros(url: "ws://0.0.0.0:9090");
  ros.connect();
  print(ros.status);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    test2();
    return MaterialApp(
      home: HomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      // },
    );
  }
}


