import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/B_details.dart';

var image = "assets/wit2.png";

// ignore: must_be_immutable
class BookingCards extends StatefulWidget {
  String bowner;
  String bcity;
  String bplace;
  String barrival;
  String bdeparture;
  String bvehicle;
  String bamount;
  String bstatus;
  String bpaymentstatus;
  BookingCards(
      {this.bowner,
      this.bcity,
      this.bplace,
      this.barrival,
      this.bdeparture,
      this.bvehicle,
      this.bamount,
      this.bstatus,
      this.bpaymentstatus});

  @override
  _BookingCardsState createState() => _BookingCardsState(bowner, bcity, bplace,
      barrival, bdeparture, bvehicle, bamount, bstatus, bpaymentstatus);
}

class _BookingCardsState extends State<BookingCards> {
  String bowner;
  String bcity;
  String bplace;
  String barrival;
  String bdeparture;
  String bvehicle;
  String bamount;
  String bstatus;
  String bpaymentstatus;
  _BookingCardsState(
      this.bowner,
      this.bcity,
      this.bplace,
      this.barrival,
      this.bdeparture,
      this.bvehicle,
      this.bamount,
      this.bstatus,
      this.bpaymentstatus);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      FlutterScaleRoute(
                          page: BookingDetails(
                        bdowner: bowner,
                        bdcity: bcity,
                        bdplace: bplace,
                        bdarrival: barrival,
                        bddeparture: bdeparture,
                        bdvehicle: bvehicle,
                        bdamount: bamount,
                        bdpaymentstatus: bpaymentstatus,
                      )));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              maxRadius: 30,
                              minRadius: 15,
                              backgroundImage: AssetImage(image),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("$bplace \nRs. $bamount"),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 12, top: 3, bottom: 3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [status(bstatus)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}

Widget status(a) {
  if (a == "active") {
    return Text(
      a,
      style: TextStyle(color: Colors.green),
    );
  }
  if (a == "clear") {
    return Text(
      a,
      style: TextStyle(color: Colors.red),
    );
  }
  return null;
}
