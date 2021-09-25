import 'package:ar_airport/hotel/hotel_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'restaurant_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'backend_test.dart';

class Category {
  Category(this.name, this.icon, this.page);
  String name = 'Airport';
  String icon = 'airport_icon.png';
  Widget page = HotelList();
}

var categories = [
  Category('Airport', 'airport_icon.png', HotelList()),
  Category('Restaurant', 'restaurant_icon.png', HotelList()),
  Category('Hotel', 'hotel_icon.png', HotelList()),
  Category('Hospital', 'hospital_icon.png', HotelList()),
  Category('Office', 'office_icon.png', HotelList()),
  Category('Shopping Mall', 'mall_icon.png', HotelList()),
];

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'images/apricot.png',
          fit: BoxFit.fitHeight,
          height: 30,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.menu, // add custom icons also
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
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 25),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: categories
                    .map((category) => CategoryCard(
                          category: category,
                        ))
                    .toList(),
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

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.category});

  final Category category;

  final Color cardColor = Color(0xFFFFE0B2);

  final ar = GetAirports();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return category.page;
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Image.asset(
              'images/' + category.icon,
            )),
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              constraints: BoxConstraints(minWidth: 200),
              height: 40,
              child: Center(
                child: Text(category.name.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
