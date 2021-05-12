import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:witpark/booking_home_card.dart';

import 'add_booking.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            // color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                AutoSizeText(
                  "Bookings",
                  style: TextStyle(fontSize: 50),
                  maxLines: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                  indent: MediaQuery.of(context).size.width * 0.2,
                  endIndent: MediaQuery.of(context).size.width * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                // color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                      BookingCards(),
                    ],
                  ),
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).size.height * 1.3,
                right: 10,
                child: FloatingActionButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.black)),
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, FlutterScaleRoute(page: AddBooking()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
