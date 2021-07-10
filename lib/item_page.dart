import 'package:ar_airport/gate_page.dart';
import 'package:flutter/material.dart';

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
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 10),
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
                        itemName: "Item 1",
                      ),
                      ItemCard(
                        itemName: "Item 2",
                      ),
                      ItemCard(
                        itemName: "Item 3",
                      ),
                      ItemCard(
                        itemName: "Item 4",
                      ),
                      ItemCard(
                        itemName: "Item 5",
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return GatePage();
                  },),);
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
                        SizedBox(width: 10,),
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
  ItemCard({required this.itemName});

  final String itemName;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color cardColor = Color(0xFFFFE0B2);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(cardColor==Color(0xFFFFE0B2)){
          setState(() {
            cardColor = Color(0xFF8BC34A);
          });
        }
        else{
          setState(() {
            cardColor = Color(0xFFFFE0B2);
          });
        }
      },
      child: Card(
        elevation: 1,
        color: cardColor,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 150,
          child: Center(
            child: Text(
              widget.itemName,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
