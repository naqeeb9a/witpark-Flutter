import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/Payment.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class AddBooking extends StatefulWidget {
  @override
  _AddBookingState createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  var _selectedAdress;
  var _selectedCity;
  var _selectedCar;

  // ignore: unused_field
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Booking',
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText("City"),
                  DropdownButton<String>(
                    value: _selectedCity,
                    items: <String>['lahore', 'karachi', 'faisalabad', 'multan']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        _selectedCity = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText("Parking available"),
                  DropdownButton<String>(
                    value: _selectedAdress,
                    items: <String>[
                      'address 1',
                      'address 2',
                      'address 3',
                      'address 4'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        _selectedAdress = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Arrival",
                style: TextStyle(fontSize: 20),
              ),
            )),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "departure",
                style: TextStyle(fontSize: 20),
              ),
            )),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText("Cars Available"),
                  DropdownButton<String>(
                    value: _selectedCar,
                    items: <String>[
                      'Car 1',
                      'Car 2',
                      'Car 3',
                      'Car 4',
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        _selectedCar = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, FlutterScaleRoute(page: Payment()));
              },
              child: Text("Proceed to Payment"),
            )
          ],
        ),
      ),
    );
  }
}
