import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
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
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.amber,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/d/d8/2014_Honda_City_%28GM6_MY14%29_VTi_sedan_%282015-07-15%29_01.jpg"),
                      radius: 40,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            child: Text(
                              "Name:  \n Arrival: \n Parking: \n Car: \n Status: \n City: \n No. plate: ",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            " Naqeeb ur rehman  \n 3:55 pm \n Johar town \n wagonR \n pending \n lahore \n LEV 12-768 ",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(
                        Icons.directions,
                        size: 60,
                      ),
                    ),
                    AutoSizeText('Get Directions')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
