import 'dart:math';

import 'package:ar_airport/gate_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ItemPage extends StatelessWidget {
  ItemPage({required this.restaurantName});

  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(this.restaurantName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 10),
                child: Text(
                  'Items',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      ItemCard(
                        itemName: "Chicken Burger",
                        itemDescription: "Try our new juicy chicken burger!",
                        img: 'images/chicken_burger.jpeg',
                      ),
                      ItemCard(
                        itemName: "Veg pasta",
                        itemDescription: "Try our new veg pasta with red sauce!",
                        img: 'images/veg_pasta.jpeg',
                      ),
                      ItemCard(
                        itemName: "Veg Burger",
                        itemDescription: "Try our healthy veg burger!",
                        img: 'images/veg_burger.jpeg',
                      ),
                      ItemCard(
                        itemName: "Dosa",
                        itemDescription:
                            "Try our dosa, which is simply awesome!",
                        img: 'images/dosa.jpeg',
                      ),
                      ItemCard(
                        itemName: "Idli",
                        itemDescription: "Try our idli, you will love it!",
                        img: 'images/idli.jpeg'
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GatePage();
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
                        "Next",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
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

class ItemCard extends StatefulWidget {
  ItemCard({required this.itemName, required this.itemDescription, required this.img});

  final String itemName;
  final String itemDescription;
  final String img;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color cardColor = Color(0xFFFFE0B2);
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
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
                widget.img,
                fit: BoxFit.fitHeight,
                width: 130,
                height: 130,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.itemName,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.itemDescription,
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        itemCount != 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.orange[100],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          itemCount--;
                                        });
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.minus,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: cardColor),
                                    ),
                                    child: Center(
                                      child: Text(itemCount.toString()),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.orange[100],
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          itemCount++;
                                        });
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.plus,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemCount++;
                                  });
                                },
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange[100],
                                  ),
                                  child: Center(
                                    child: Text('ADD'),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
