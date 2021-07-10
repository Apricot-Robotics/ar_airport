import 'package:flutter/material.dart';
import 'restaurant_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Airport',
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: ListView(
                  children: [
                    AirportCard(
                      name: "BIA",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AirportCard extends StatelessWidget {
  AirportCard({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestaurantPage(airportName: name,);
        }));
      },
      child: Card(
        elevation: 5,
        color: Colors.orange[100],
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 150,
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
