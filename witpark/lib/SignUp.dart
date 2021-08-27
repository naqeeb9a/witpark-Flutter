import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

// import 'package:flutter_transitions/flutter_transitions.dart';
// import 'package:witpark/HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _checkBoxVal = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  postData() async {
    var response = await http.post(
        Uri.parse("http://witpark.pythonanywhere.com/API/Signup_API/"),
        body: _authData);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 201 &&
        jsonData["message"] == "Data saved successfully") {
      showToast("successfully registered please login now", context: context);
      Navigator.pop(context);
      print(response.body);
      setState(() {
        _isloading = false;
      });
    } else if (jsonData["status"] == 204 &&
        jsonData["message"] == "Invalid data") {
      showToast("User details were wrong or the user exists already",
          context: context);
      setState(() {
        _isloading = false;
      });
    } else {
      //Simple to use, no global configuration
      showToast("Error try again", context: context);
      setState(() {
        _isloading = false;
      });
    }
  }

  load() {
    setState(() {
      _isloading = true;
    });
    _submit();
  }

  var _isloading = false;

  var _authData = {
    "username": "",
    "first_name": "",
    "last_name": "",
    "email": "",
    "password": "",
    "phone": "",
    "city": "",
  };

  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    postData();
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Colors.amber,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Create Account',
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
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 90,
                        endIndent: 90,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.068,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "Username",
                                      hintText: "Enter a unique username"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter a username first";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["username"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "First name",
                                      hintText: "Enter your First Name"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter a name first";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["first_name"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "Last Name",
                                      hintText: "Enter your Last Name"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter a name first";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["last_name"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      isDense: true,
                                      hintText: "someone@gmail.com"),
                                  validator: (value) {
                                    if (value.isEmpty || !value.contains("@")) {
                                      return "Enter a Valid email";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["email"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "Password",
                                      hintText: "Enter password"),
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 6) {
                                      return "Password is too short";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["password"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "Confirm Password",
                                      hintText: "Confirm your password"),
                                  validator: (value) {
                                    if (value != _passwordController.text ||
                                        value.isEmpty) {
                                      return "Password doesn't match";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "Mobile number",
                                      hintText: "Enter your phone number",
                                      counterText: ""),
                                  maxLength: 11,
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 11) {
                                      return "Enter a valid number";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["phone"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "City",
                                      hintText: "Enter your city name"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData["city"] = value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Checkbox(
                                      value: _checkBoxVal,
                                      onChanged: (value) {
                                        setState(() => _checkBoxVal = value);
                                      },
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: AutoSizeText(
                                        "I have accepted the terms and conditions",
                                        style: TextStyle(fontSize: 15),
                                        maxLines: 3,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                ElevatedButton(
                                  onPressed: _checkBoxVal ? load : null,
                                  child: Text("Sign up"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amber),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
