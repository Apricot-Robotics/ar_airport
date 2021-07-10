import 'package:flutter/material.dart';

import 'item_page.dart';

class RestaurantPage extends StatelessWidget {
  RestaurantPage({required this.airportName});

  final String airportName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(this.airportName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Restaurant',
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: ListView(
                  children: [
                    RestaurantCard(
                      name: "Restaurant 1",
                    ),
                    RestaurantCard(
                      name: "Restaurant 2",
                    ),
                    RestaurantCard(
                      name: "Restaurant 3",
                    ),
                    RestaurantCard(
                      name: "Restaurant 4",
                    ),
                    RestaurantCard(
                      name: "Restaurant 5",
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

class RestaurantCard extends StatelessWidget {
  RestaurantCard({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ItemPage(
            restaurantName: name,
          );
        }));
      },
      child: Card(
        elevation: 1,
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
