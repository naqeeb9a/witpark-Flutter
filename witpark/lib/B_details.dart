import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookingDetails extends StatefulWidget {
  String bdowner;
  String bdcity;
  String bdplace;
  String bdarrival;
  String bddeparture;
  String bdvehicle;
  String bdamount;
  String bdpaymentstatus;
  BookingDetails(
      {this.bdowner,
      this.bdcity,
      this.bdplace,
      this.bdarrival,
      this.bddeparture,
      this.bdvehicle,
      this.bdamount,
      this.bdpaymentstatus});
  @override
  _BookingDetailsState createState() => _BookingDetailsState(bdowner, bdcity,
      bdplace, bdarrival, bddeparture, bdvehicle, bdamount, bdpaymentstatus);
}

class _BookingDetailsState extends State<BookingDetails> {
  String bdowner;
  String bdcity;
  String bdplace;
  String bdarrival;
  String bddeparture;
  String bdvehicle;
  String bdamount;
  String bdpaymentstatus;
  _BookingDetailsState(this.bdowner, this.bdcity, this.bdplace, this.bdarrival,
      this.bddeparture, this.bdvehicle, this.bdamount, this.bdpaymentstatus);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking details',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 90,
              endIndent: 90,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    "Parking Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          child: AutoSizeText(
                            "Name:  \n city: \n Parking: \n Arrival: \n Departure: \n No. plate: \n Amount: \n Credit: ",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Container(
                        child: AutoSizeText(
                          " $bdowner  \n $bdcity \n $bdplace \n $bdarrival \n $bddeparture \n $bdvehicle \n $bdamount \n $bdpaymentstatus ",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.directions,
                    size: 50,
                    color: Colors.black,
                  ),
                  AutoSizeText('Get Directions')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
