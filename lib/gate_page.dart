import 'package:flutter/material.dart';
import 'thank_you_page.dart';
import 'dart:async';
import 'backend_test.dart';

class GatePage extends StatefulWidget {
  GatePage();

  @override
  _GatePageState createState() => _GatePageState();
}

class _GatePageState extends State<GatePage> {
  int? gateNum = 0;
  final ar = GetAirports();
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 10),
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
                      for (var i = 0; i < 25; i++)
                        ListTile(
                          title: Text('Gate ' + (i+1).toString()),
                          leading: Radio<int>(
                            value: i+1,
                            groupValue: gateNum,
                            onChanged: (int? value) {
                              setState(() {
                                gateNum = value;
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ar.sendOrder();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ThankYouPage();
                      },
                    ),
                  );
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
