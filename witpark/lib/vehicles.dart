import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/EditVehicle.dart';
import 'package:witpark/LoginPage.dart';
import 'package:witpark/add_vehicles.dart';
import 'package:witpark/vehicles_cards.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Vehicles extends StatefulWidget {
  @override
  _VehiclesState createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  var vLength;
  Future<List<VehiclesData>> _getUsers() async {
    var data = await http.get(
        Uri.parse("http://witpark.pythonanywhere.com/API/AllVehicles_API/"));
    var jsonData = json.decode(data.body);
    List<VehiclesData> users = [];

    for (var u in jsonData["data"]) {
      if (u["vehicle_owner"] == usernameLogin) {
        VehiclesData user = VehiclesData(
            u["vehicle_id"],
            u["vehicle_owner"],
            u["vehicle_name"],
            u["vehicle_model"].toString(),
            u["vehicle_color"],
            u["vehicle_no_plate"]);

        users.add(user);
      }
    }
    vLength = users;
    return users;
  }

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
      body: SingleChildScrollView(
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
                      ),
                    ),
                  );
                } else if (snapshot.data.length == 0) {
                  return Center(child: Text("No vehicles registered"));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  FlutterScaleRoute(
                                      page: EditVehicle(
                                          snapshot.data[index].vehicle_id)))
                              .then((_) {
                            _getUsers();
                            setState(() {});
                          });
                        },
                        child: VechiclesCards(
                            vname: snapshot.data[index].vehicle_name,
                            vmodel: snapshot.data[index].vehicle_model,
                            vnoplate: snapshot.data[index].vehicle_no_plate,
                            vcolor: snapshot.data[index].vehicle_color),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                    context, FlutterScaleRoute(page: AddVehicles(vLength)))
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

class VehiclesData {
  // ignore: non_constant_identifier_names
  var vehicle_id;
  // ignore: non_constant_identifier_names
  var vehicle_owner;
  // ignore: non_constant_identifier_names
  var vehicle_name;
  // ignore: non_constant_identifier_names
  var vehicle_model;
  // ignore: non_constant_identifier_names
  var vehicle_color;
  // ignore: non_constant_identifier_names
  var vehicle_no_plate;
  VehiclesData(this.vehicle_id, this.vehicle_owner, this.vehicle_name,
      this.vehicle_model, this.vehicle_color, this.vehicle_no_plate);
}
