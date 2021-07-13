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
                      name: "R1",
                      cuisines: 'South Indian',
                    ),
                    RestaurantCard(
                      name: "R2",
                      cuisines: 'Italian',
                    ),
                    RestaurantCard(
                      name: "R3",
                      cuisines: 'South Indian, Italian, American',
                    ),
                    RestaurantCard(
                      name: "R4",
                      cuisines: 'Chinese',
                    ),
                    RestaurantCard(
                      name: "R5",
                      cuisines: 'North Indian',
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
  RestaurantCard({required this.name, required this.cuisines});

  final String name;
  final String cuisines;

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
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: GoogleFonts.neucha(fontSize: 48, color: Colors.white),
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
                        'Restaurant ' + name,
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
