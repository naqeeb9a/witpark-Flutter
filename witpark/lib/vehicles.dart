import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/add_vehicles.dart';
import 'package:witpark/vehicles_cards.dart';

class Vehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Vehicles',
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
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
              child: Column(children: [
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 90,
              endIndent: 90,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            VechiclesCards(),
            VechiclesCards(),
            VechiclesCards(),
          ])),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height * 1.6,
          right: 10,
          child: FloatingActionButton(
            shape: CircleBorder(side: BorderSide(color: Colors.amber)),
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, FlutterScaleRoute(page: AddVehicles()));
            },
          ),
        )
      ]),
    );
  }
}
