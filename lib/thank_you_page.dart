import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'backend_test.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key? key}) : super(key: key);

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fastfood_rounded,
                    size: 108,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Thank you! Your order will be arriving shortly...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
