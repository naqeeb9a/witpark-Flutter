import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:witpark/LoginPage.dart';
import 'package:witpark/edit_profile.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class AddVehicles extends StatefulWidget {
  var vvlenght;
  AddVehicles(this.vvlenght);
  @override
  _AddVehiclesState createState() => _AddVehiclesState(vvlenght);
}

class _AddVehiclesState extends State<AddVehicles> {
  var vvlenght;
  _AddVehiclesState(this.vvlenght);
  var name = "";

  var year = "";

  var brand = "";

  var noPlate = "";

  final GlobalKey<FormState> _formKey = GlobalKey();

  var _authData = {
    "vehicle_owner": "",
    "vehicle_name": "",
    "vehicle_model": "",
    "vehicle_color": "",
    "vehicle_no_plate": ""
  };
  postData() async {
    _authData["vehicle_owner"] = usernameLogin;
    if (vvlenght.length < 3) {
      var response = await http.post(
          Uri.parse("http://witpark.pythonanywhere.com/API/Add_Vehicle_API/"),
          body: _authData);
      if (response.statusCode == 200 ||
          response.statusCode == 201 && vvlenght.length < 3) {
        showToast("successfully added", context: context);
        Navigator.pop(context);
      } else {
        //Simple to use, no global configuration
        showToast("Error try again", context: context);
      }
    } else if (vvlenght.length >= 3) {
      showToast("You can't add more than three vehicles", context: context);
    } else {
      //Simple to use, no global configuration
      showToast("Error try again", context: context);
    }
  }

  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            'Add Vehicles',
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
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "car Name",
                            hintText: "Enter car's name",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter the name of the car";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData["vehicle_name"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Car's model",
                            hintText: "Enter car's year model",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a model of the car";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData["vehicle_model"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Car color",
                            hintText: "Enter car's color",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a color of the car";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData["vehicle_color"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Number Plate",
                            hintText: "Enter car's number plate's number",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter the number plate of the car";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData["vehicle_no_plate"] = value;
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            spacer(context, 0.08),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.black),
              ),
            )
          ])),
        ));
  }
}
