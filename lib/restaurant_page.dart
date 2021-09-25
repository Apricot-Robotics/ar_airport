import 'package:flutter/material.dart';
import 'item_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                style: GoogleFonts.lato(fontSize: 24),
              ),
              Expanded(
                child: ListView(
                  children: [
                    RestaurantCard(
                      name: "Subway",
                      cuisines: 'American, Fast Food, Healthy',
                      img: 'images/subway.png',
                    ),
                    RestaurantCard(
                      name: "Shiv Sagar",
                      cuisines: 'South Indian',
                      img: 'images/shivsagar.png',
                    ),
                    RestaurantCard(
                      name: "KFC",
                      cuisines: 'American, Fast Food',
                      img: 'images/kfc.jpeg',
                    ),
                    RestaurantCard(
                      name: "Cafe Coffee Day",
                      cuisines: 'Snacks, Coffee, Tea',
                      img: 'images/ccd.jpeg',
                    ),
                    RestaurantCard(
                      name: "Smoor",
                      cuisines: 'Chocolates, Dessert',
                      img: 'images/smoor.jpeg',
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
  RestaurantCard({required this.name, required this.cuisines, required this.img});

  final String name;
  final String cuisines;
  final String img;

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
        color: Colors.orangeAccent,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.alegreyaSans(
                            fontSize: 22, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Flexible(
                            child: Text(
                              cuisines,
                              style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
