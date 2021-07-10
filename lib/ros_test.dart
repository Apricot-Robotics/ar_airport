import 'package:flutter/material.dart';
import 'package:roslib/roslib.dart';
import 'package:roslib/core/topic.dart';
import 'dart:async';

void main() {
  Ros ros = Ros(url: "ws://0.0.0.0:9090");
  ros.connect();
  Topic cmdVel = Topic(
      ros: ros,
      name: '/cmd_vel',
      type: 'geometry_msgs/Twist'
  );
  final msg = {
    'linear': {'x': 0.5, 'y': 0.0, 'z': 0.0},
    'angular': {'x': 0.0, 'y': 0.0, 'z': 0.0},
  };
  cmdVel.publish(msg);
}