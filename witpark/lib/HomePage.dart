import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:witpark/Booking.dart';
import 'package:witpark/Home.dart';
import 'package:witpark/Nearby.dart';
import 'package:witpark/Porfile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selecteditem = 0;
  var pages = [Home(), Booking(), Nearby(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: (_selecteditem == 0 || _selecteditem == 2)
              ? Colors.amber
              : Colors.white,
          height: MediaQuery.of(context).size.height * 0.06,
          backgroundColor: (_selecteditem == 0 || _selecteditem == 2)
              ? Colors.white
              : Colors.amber,
          items: [
            Icon(
              Icons.home,
            ),
            Icon(Icons.book_online),
            Icon(
              Icons.near_me,
            ),
            Icon(Icons.person),
          ],
          onTap: (index) {
            setState(() {
              _selecteditem = index;
            });
          },
          animationDuration: Duration(milliseconds: 300),
        ),
        body: Center(
          child: pages[_selecteditem],
        ));
  }
}
