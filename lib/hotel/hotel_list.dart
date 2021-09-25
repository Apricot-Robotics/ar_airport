import 'package:ar_airport/hotel/hotel_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../restaurant_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Hotel {
  Hotel(this.name, this.img, this.location);
  String name = 'Taj Bangalore';
  String img = 'images/bia.jpeg';
  String location = 'Bangalore, Karnataka';
}

var hotels = [
  Hotel('Taj Bangalore', 'images/taj_bangalore.jpeg', 'Bangalore, Karnataka'),
  Hotel('Taj West End', 'images/taj_west_end.jpeg', 'Bangalore, Karnataka')
];

class HotelList extends StatelessWidget {
  const HotelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'images/apricot.png',
          fit: BoxFit.fitHeight,
          height: 30,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            return Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
            color: Colors.orange,
            // size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 15,
              child: Text(
                'J',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 6,
              color: Colors.orange,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hotels',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.hotel,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 40,
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: ListView(
                  children: hotels
                      .map((hotel) => HotelCard(
                            hotel: hotel,
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              height: 4,
              color: Colors.black,
            ),
            Container(
              height: 6,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  HotelCard({required this.hotel});

  final Hotel hotel;

  final Color cardColor = Color(0xFFFFE0B2);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HotelServices(
            hotelName: hotel.name,
          );
        }));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5),
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
                  hotel.img,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
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
                              hotel.location,
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.w600),
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
