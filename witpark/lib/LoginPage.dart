import 'dart:async';
import 'dart:convert';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/ForgotPassword.dart';
import 'package:witpark/HomePage.dart';
import 'package:witpark/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:witpark/skip.dart';

var usernameLogin;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  bool _checkBoxVal = true;
  AnimationController _animationController;
  signIn() async {
    Map data = {
      "username": _authData["username"],
      "password": _authData["password"]
    };
    var response = await http.post(
        Uri.parse('http://witpark.pythonanywhere.com/API/Login_API/'),
        body: data);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonData;
    jsonData = jsonDecode(response.body);
    if (response.statusCode == 200 &&
        jsonData["message"] == _authData["username"] + " Login successfully") {
      usernameLogin = _authData["username"];
      setState(() {
        pref.setString("token", usernameLogin);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showToast("username or password incorrect or does not exists",
          context: context);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  var _authData = {
    "username": "",
    "password": "",
  };
  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    signIn();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Timer(Duration(milliseconds: 1000), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            body: Center(
                child: CircularProgressIndicator(
            color: Colors.amber,
            strokeWidth: 2,
          )))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.04),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: InkWell(
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.amber),
                      ),
                      onTap: () {
                        Navigator.push(
                            context, FlutterScaleRoute(page: Skip()));
                      },
                    ),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(top: 10),
                          child: Image.asset('assets/bg.jpg'),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                      SlideTransition(
                        position:
                            Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                                .animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Container(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Email/username",
                                          hintText:
                                              "Enter your email or usename"),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Username/email cannot be empty";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _authData["username"] = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "password",
                                        hintText: "Enter your password",
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "password is empty";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _authData["password"] = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              onChanged: (bool value) {
                                                setState(() =>
                                                    this._checkBoxVal = value);
                                              },
                                              value: this._checkBoxVal,
                                            ),
                                            Text("Remember me")
                                          ],
                                        ),
                                        InkWell(
                                          child: Text("Forgot password?"),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FlutterScaleRoute(
                                                    page: ForgotPassword()));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      child: Text('Sign in'),
                                      onPressed: () {
                                        _submit();
                                      }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.021,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account? "),
                                      InkWell(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(color: Colors.amber),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              FlutterScaleRoute(
                                                  page: SignUp()));
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.021,
                                  ),
                                  // Text("Or Sign up with"),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height *
                                  //       0.03,
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Padding(
                                  //       padding:
                                  //           const EdgeInsets.only(right: 10),
                                  //       child: Container(
                                  //         height: MediaQuery.of(context)
                                  //                 .size
                                  //                 .height *
                                  //             0.08,
                                  //         width: MediaQuery.of(context)
                                  //                 .size
                                  //                 .width *
                                  //             0.15,
                                  //         child: Image.asset('assets/fb.png'),
                                  //         alignment: Alignment.center,
                                  //       ),
                                  //     ),
                                  //     Container(
                                  //       height:
                                  //           MediaQuery.of(context).size.height *
                                  //               0.08,
                                  //       width:
                                  //           MediaQuery.of(context).size.width *
                                  //               0.1,
                                  //       alignment: Alignment.center,
                                  //       child: Image.asset('assets/google.png'),
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
