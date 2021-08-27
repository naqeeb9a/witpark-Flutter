import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:witpark/LoginPage.dart';
import 'package:witpark/edit_profile.dart';
import 'package:http/http.dart' as http;

class DeleteUser extends StatefulWidget {
  @override
  _DeleteUserState createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  SharedPreferences pref;
  getpref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    getpref();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    deleteUser();
  }

  deleteUser() async {
    var res = await http.post(
        Uri.parse("http://witpark.pythonanywhere.com/API/Delete_User_API/"),
        body: data);
    print(res.statusCode);
    var jsonData = jsonDecode(res.body);
    print(jsonData);
    if (jsonData["message"] == "Deleted successfully") {
      pref.clear();
      // ignore: deprecated_member_use
      pref.commit();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
      showToast("Successfully deleted", context: context);
    } else if (jsonData["message"] == "Invalid data") {
      showToast("Check your password", context: context);
    } else {
      showToast("User not deleted", context: context);
    }
  }

  var data = {"username": usernameLogin, "password": ""};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Delete user",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Divider(
                thickness: 2,
                color: Colors.black,
                indent: 140,
                endIndent: 140,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.kindpng.com/picc/m/130-1300377_transparent-eliminate-clipart-delete-user-icon-png-png.png"),
                  maxRadius: 60,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: "Password"),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "this field cannot be empty";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                data["password"] = value;
                              },
                            ),
                            spacer(context, 0.2),
                            ElevatedButton(
                              child: Text("Delete"),
                              onPressed: () {
                                _submit();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
