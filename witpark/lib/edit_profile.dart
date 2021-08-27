import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:witpark/booking_home_card.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  // ignore: non_constant_identifier_names
  var Pid;
  EditProfile(this.Pid);
  @override
  _EditProfileState createState() => _EditProfileState(Pid);
}

class _EditProfileState extends State<EditProfile> {
  // ignore: non_constant_identifier_names
  var Pid;
  updateUser() async {
    print(Pid);
    var res = await http.put(
        Uri.parse(
            "https://witpark.pythonanywhere.com/API/Update_User_API/$Pid"),
        body: data);
    var jsondata = jsonDecode(res.body);
    print(jsondata);
    print(res.statusCode);
    if (res.statusCode == 200) {
      showToast("Successfully updated", context: context);
      Navigator.pop(context);
    } else {
      showToast("Not updated some error occured", context: context);
    }
  }

  _EditProfileState(this.Pid);
  final GlobalKey<FormState> _formKey = GlobalKey();

  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    updateUser();
  }

  var data = {
    "first_name": "",
    "last_name": "",
    "email": "",
    "city": "",
    "phone": ""
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  maxRadius: 60,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "firstname",
                            hintText: "Enter first name",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          data["first_name"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "last name",
                            hintText: "Enter last name",
                            counterText: ''),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          data["last_name"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "email",
                            hintText: "Enter your email address",
                            counterText: ''),
                        validator: (value) {
                          if (value.isEmpty || !value.contains("@")) {
                            return "check your email again";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          data["email"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 11,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "city",
                            hintText: "enter the city u live in",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          data["city"] = value;
                        },
                      ),
                      spacer(context, 0.01),
                      TextFormField(
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "phone no",
                            hintText: "enter the phone number",
                            counterText: ""),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field cannot be empty";
                          } else if (value.length < 11) {
                            return "Phone number should have 11 digits check again";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          data["phone"] = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget spacer(BuildContext context, double value) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * value,
  );
}
