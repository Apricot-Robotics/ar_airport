import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'restaurant_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
                style: GoogleFonts.lato(fontSize: 24),
              ),
              Expanded(
                child: ListView(
                  children: [
                    AirportCard(
                      name: "Kempegowda International Airport",
                      img: 'images/bia.jpeg',
                      location: 'Bangalore, Karnataka',
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
  AirportCard({required this.name, required this.img, required this.location});

  final String name;
  final String img;
  final String location;

  final Color cardColor = Color(0xFFFFE0B2);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestaurantPage(
            airportName: name,
          );
        }));
      },
      child: Card(
        elevation: 5,
        color: cardColor,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  img,
                  fit: BoxFit.fitHeight,
                  width: 130,
                  height: 130,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.alegreyaSans(
                            fontSize: 22, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              location,
                              style: GoogleFonts.lato(fontWeight: FontWeight.w600),
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
