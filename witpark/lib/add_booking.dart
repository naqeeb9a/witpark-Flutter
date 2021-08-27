import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/LoginPage.dart';
import 'package:witpark/Payment.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:http/http.dart' as http;
import 'package:witpark/edit_profile.dart';

class AddBooking extends StatefulWidget {
  @override
  _AddBookingState createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  var _selectedAdress;
  var _selectedCar;
  var _mySelection;
  var _addData = {
    "booking_id": "",
    "booking_owner": "",
    "booking_city": "",
    "booking_place": "",
    "booking_arrival": DateTime.now().toString().substring(0, 10),
    "booking_departure": DateTime.now().toString().substring(0, 10),
    "booking_vehicle": "",
    "booking_amount": "",
    "booking_payment_date": "",
    "booking_status": "active",
    "booking_payment_status": "clear",
    "booking_entrance_time": "null",
    "booking_exit_time": "null",
  };
  _getProperData(a, b, c) {
    for (var u = 0; u < data.length; u++) {
      if (a == data[u]["id"].toString()) {
        _addData["booking_city"] = data[u]["city_name"];
      }
    }
    for (var u = 0; u < data1.length; u++) {
      if (b == data1[u]["id"].toString()) {
        _addData["booking_place"] = data1[u]["place_name"];
      }
    }
    for (var u = 0; u < data2.length; u++) {
      if (c == data2[u]["vehicle_id"].toString()) {
        _addData["booking_vehicle"] = data2[u]["vehicle_no_plate"];
      }
    }
  }

  _validateDate(a, b) {
    var year = a.toString().substring(0, 4);
    var month = a.toString().substring(5, 7);
    var date = a.toString().substring(8, 10);
    var year1 = b.toString().substring(0, 4);
    var month1 = b.toString().substring(5, 7);
    var date1 = b.toString().substring(8, 10);
    var diffMonth = int.parse(month) - int.parse(month1);
    if (diffMonth.isNegative) {
      diffMonth = diffMonth * -1;
    }
    if (int.parse(year) > int.parse(year1) ||
        int.parse(month) > int.parse(month1)) {
      showToast("departure date cannot be before arrival", context: context);
    } else if (int.parse(year) != int.parse(year1)) {
      showToast("parkings can't be yearly basis", context: context);
    } else if (diffMonth > 1) {
      showToast("You can't book a spot for more than a month",
          context: context);
    } else if (int.parse(date) > int.parse(date1) &&
        int.parse(month) == int.parse(month1)) {
      showToast("Depature date is before arrival", context: context);
    } else {
      Navigator.push(
          context, FlutterScaleRoute(page: Payment(payData: _addData)));
    }
  }

  final String url = "http://witpark.pythonanywhere.com/API/AllCities_API/";
  final String url1 = "http://witpark.pythonanywhere.com/API/AllVehicles_API/";

  // ignore: deprecated_member_use
  List data = List(); //edited line
  // ignore: deprecated_member_use
  List data1 = List(); //edited line
  // ignore: deprecated_member_use
  List data2 = List(); //edited line

  Future<String> getSWData() async {
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody["data"];
    });

    // print(resBody);

    return "Sucess";
  }

  Future<String> getSWData1() async {
    var res = await http.get(
        Uri.parse("http://witpark.pythonanywhere.com/API/AllPlaces_API/"),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data1 = resBody["data"];
    });

    // print(resBody);

    return "Sucess";
  }

  var data3 = [];

  Future<String> getSWData2() async {
    var res = await http
        .get(Uri.parse(url1), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data2 = resBody["data"];
    });
    var i = 0;
    for (var u in data2) {
      if (u["vehicle_owner"] == usernameLogin && i < 3) {
        data3.add(
            {"vehicle_name": u["vehicle_name"], "vehicle_id": u["vehicle_id"]});
        i++;
      }
    }
    print(data3);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    DateTime.now();
    this.getSWData();
    this.getSWData1();
    this.getSWData2();
  }

  // ignore: unused_field
  DateTime _selectedValue, _selectedOValue = DateTime.now();

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Divider(
                color: Colors.black,
                thickness: 2,
                indent: 90,
                endIndent: 90,
              ),
              spacer(context, 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("City"),
                    DropdownButton(
                      items: data.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item['city_name']),
                          value: item['id'].toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _mySelection = newVal;
                          _addData["booking_city"] = _mySelection;
                        });
                      },
                      value: _mySelection,
                    ),
                  ],
                ),
              ),
              spacer(context, 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Parking available"),
                    DropdownButton(
                      items: data1.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item['place_name']),
                          value: item['id'].toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedAdress = newVal;
                          _addData["booking_place"] = _selectedAdress;
                        });
                      },
                      value: _selectedAdress,
                    ),
                  ],
                ),
              ),
              spacer(context, 0.02),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Arrival",
                  style: TextStyle(fontSize: 20),
                ),
              )),
              spacer(context, 0.02),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                    _addData["booking_arrival"] =
                        _selectedValue.toString().substring(0, 10);
                  });
                },
              ),
              spacer(context, 0.02),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Departure",
                  style: TextStyle(fontSize: 20),
                ),
              )),
              spacer(context, 0.02),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedOValue = date;
                    _addData["booking_departure"] =
                        _selectedOValue.toString().substring(0, 10);
                  });
                },
              ),
              spacer(context, 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Cars Available"),
                    data3.length == 0
                        ? Text(
                            "No Vehicles registered",
                            style: TextStyle(color: Colors.red),
                          )
                        : DropdownButton(
                            items: data3.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['vehicle_name']),
                                value: item['vehicle_id'].toString(),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                _selectedCar = newVal;
                                _addData["booking_vehicle"] = _selectedCar;
                              });
                            },
                            value: _selectedCar),
                  ],
                ),
              ),
              spacer(context, 0.06),
              ElevatedButton(
                onPressed: () {
                  if (_selectedCar == null ||
                      _mySelection == null ||
                      _selectedAdress == null) {
                    showToast("Please select all options", context: context);
                  } else {
                    _getProperData(_addData["booking_city"],
                        _addData["booking_place"], _addData["booking_vehicle"]);
                    _validateDate(_addData["booking_arrival"],
                        _addData["booking_departure"]);
                  }
                },
                child: Text("Proceed to Payment"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
