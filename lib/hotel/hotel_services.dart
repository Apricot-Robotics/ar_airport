import 'package:ar_airport/hotel/hotel_list.dart';
import 'package:ar_airport/hotel/hotel_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelRestaurant {
  HotelRestaurant(this.name, this.img, this.cuisine);
  String name = 'Taj Bangalore';
  String img = 'images/bia.jpeg';
  String cuisine = 'Japanese, Chinese';
}

var hotelRestaurants = [
  HotelRestaurant('Cafe 77 East', 'images/cafe77.jpeg',
      'Pan Indian street food, Multi-Cuisine, Local South Indian delicacies'),
  HotelRestaurant('Soi And Sake', 'images/soiSake.jpeg', 'Japanese, Chinese'),
  HotelRestaurant(
      'Tamarind', 'images/tamarind.jpeg', 'Rajasthani, Punjabi, Awadhi'),
  HotelRestaurant('Lounge Bar', 'images/loungeBar.jpeg',
      'Coffee, Hors d\'oeuvres and pastries, Tea, Global to - go cuisine'),
];

class HotelServices extends StatefulWidget {
  final String hotelName;

  const HotelServices({Key? key, required this.hotelName}) : super(key: key);

  @override
  _HotelServicesState createState() => _HotelServicesState();
}

class _HotelServicesState extends State<HotelServices>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.hotelName,
          style: TextStyle(color: Colors.orange),
        ),
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
        bottom: TabBar(
          indicatorColor: Colors.orange,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text(
                'Restaurants',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            Tab(
              child: Text(
                'Room Service',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: ListView(
                children: hotelRestaurants
                    .map((hotelRestaurant) => HotelRestaurantCard(
                          hotelRestaurant: hotelRestaurant,
                        ))
                    .toList(),
              ),
            ),
          ),
          Center(
            child: Text(
              "Coming Soon!",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelRestaurantCard extends StatelessWidget {
  HotelRestaurantCard({required this.hotelRestaurant});

  final HotelRestaurant hotelRestaurant;

  final Color cardColor = Color(0xFFFFE0B2);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HotelRestaurantMenu(
            hotelRestaurantName: hotelRestaurant.name,
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
                  hotelRestaurant.img,
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
                        hotelRestaurant.name,
                        style: GoogleFonts.alegreyaSans(
                            fontSize: 22, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Icon(
                            Icons.restaurant_menu_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              hotelRestaurant.cuisine,
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
