import 'package:flutter/material.dart';
import 'thank_you_page.dart';
import 'package:roslib/roslib.dart';
import 'package:roslib/core/topic.dart';
import 'dart:async';

class GatePage extends StatelessWidget {
  GatePage();

  @override
  Widget build(BuildContext context) {
    Ros ros = Ros(url: 'ws://0.0.0.0:9090');
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'images/apricot.png',
          fit: BoxFit.fitHeight,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 10),
                child: Text(
                  'Delivery Location',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView(
                    children: [
                      for (var i=0; i<25; i++) GateCard(gateNumber: i+1)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ThankYouPage();
                  },),);
                },
                child: Container(
                  height: 60,
                  color: Colors.black87,
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Place order",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GateCard extends StatefulWidget {
  GateCard({required this.gateNumber});

  final int gateNumber;

  @override
  _GateCardState createState() => _GateCardState();
}

class _GateCardState extends State<GateCard> {
  Color cardColor = Color(0xFFFFE0B2);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(cardColor==Color(0xFFFFE0B2)){
          setState(() {
            cardColor = Color(0xFF8BC34A);
          });
        }
        else{
          setState(() {
            cardColor = Color(0xFFFFE0B2);
          });
        }
      },
      child: Card(
        elevation: 1,
        color: cardColor,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 150,
          child: Center(
            child: Text(
              "Gate "+ widget.gateNumber.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}