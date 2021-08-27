import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:witpark/LoginPage.dart';
import 'package:witpark/booking_home_card.dart';
import 'package:http/http.dart' as http;

import 'add_booking.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Future<List<bookingData>> _getUsers() async {
    var data = await http.get(
        Uri.parse("http://witpark.pythonanywhere.com/API/AllBookings_API/"));
    var jsonData = json.decode(data.body);

    List<bookingData> users = [];

    for (var u in jsonData["data"]) {
      if (u["booking_owner"] == usernameLogin) {
        bookingData user = bookingData(
            u["booking_id"],
            u["booking_owner"],
            u["booking_city"],
            u["booking_place"],
            u["booking_arrival"],
            u["booking_departure"],
            u["booking_vehicle"],
            u["booking_amount"],
            u["booking_payment_date"],
            u["booking_status"],
            u["booking_payment_status"]);
        users.add(user);
      }
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  AutoSizeText(
                    "Bookings",
                    style: TextStyle(fontSize: 50),
                    maxLines: 1,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    indent: MediaQuery.of(context).size.width * 0.2,
                    endIndent: MediaQuery.of(context).size.width * 0.2,
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: FutureBuilder(
                      future: _getUsers(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else if (snapshot.data.length == 0) {
                          return Center(
                            child: Text("No bookings have been made yet"),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return BookingCards(
                                bowner: snapshot.data[index].booking_owner,
                                bcity: snapshot.data[index].booking_city,
                                bplace: snapshot.data[index].booking_place,
                                barrival: snapshot.data[index].booking_arrival,
                                bdeparture:
                                    snapshot.data[index].booking_departure,
                                bvehicle: snapshot.data[index].booking_vehicle,
                                bamount: snapshot.data[index].booking_amount,
                                bstatus: snapshot.data[index].booking_status,
                                bpaymentstatus:
                                    snapshot.data[index].booking_payment_status,
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          shape: CircleBorder(side: BorderSide(color: Colors.black)),
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, FlutterScaleRoute(page: AddBooking()))
                .then((_) {
              setState(() {});
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

// ignore: camel_case_types
class bookingData {
  // ignore: non_constant_identifier_names
  var booking_id;
  // ignore: non_constant_identifier_names
  var booking_owner;
  // ignore: non_constant_identifier_names
  var booking_city;
  // ignore: non_constant_identifier_names
  var booking_place;
  // ignore: non_constant_identifier_names
  var booking_arrival;
  // ignore: non_constant_identifier_names
  var booking_departure;
  // ignore: non_constant_identifier_names
  var booking_vehicle;
  // ignore: non_constant_identifier_names
  var booking_amount;
  // ignore: non_constant_identifier_names
  var booking_payment_date;
  // ignore: non_constant_identifier_names
  var booking_status;
  // ignore: non_constant_identifier_names
  var booking_payment_status;
  bookingData(
      this.booking_id,
      this.booking_owner,
      this.booking_city,
      this.booking_place,
      this.booking_arrival,
      this.booking_departure,
      this.booking_vehicle,
      this.booking_amount,
      this.booking_payment_date,
      this.booking_status,
      this.booking_payment_status);
}
