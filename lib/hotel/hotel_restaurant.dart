import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Item {
  Item(this.name, this.img, this.description);
  String name = 'Chicken Pasta';
  String img = 'images/bia.jpeg';
  String description = 'Delicious!';
}

var menu = [
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
  Item('Veg Pasta', 'images/veg_pasta.jpeg', 'Delicious!'),
];

class HotelRestaurantMenu extends StatelessWidget {
  final String hotelRestaurantName;

  HotelRestaurantMenu({required this.hotelRestaurantName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          this.hotelRestaurantName,
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 6,
              color: Colors.orange,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: ListView(
                  children: menu
                      .map((item) => ItemCard(
                            item: item,
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              height: 4,
              color: Colors.orange,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                color: Colors.black87,
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(fontSize: 24, color: Colors.orange),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.orange,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  ItemCard({required this.item});

  final Item item;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color cardColor = Color(0xFFFFE0B2);
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                widget.item.img,
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
                          widget.item.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.item.description,
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
                                      color: Colors.orange,
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
                                      color: Colors.orange,
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
                                    color: Colors.orange,
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
