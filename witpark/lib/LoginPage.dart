import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/ForgotPassword.dart';
import 'package:witpark/HomePage.dart';
import 'package:witpark/SignUp.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checkBoxVal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.04),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: InkWell(
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.amber),
                ),
                onTap: () {
                  Navigator.push(context, FlutterScaleRoute(page: HomePage()));
                },
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email/username",
                              hintText: "Enter your email or usename"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "password",
                              hintText: "Enter your password"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  onChanged: (bool value) {
                                    setState(() => this._checkBoxVal = value);
                                  },
                                  value: this._checkBoxVal,
                                ),
                                Text("Remember me")
                              ],
                            ),
                            InkWell(
                              child: Text("Forgot password?"),
                              onTap: () {
                                Navigator.push(context,
                                    FlutterScaleRoute(page: ForgotPassword()));
                              },
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                          child: Text('Sign in'),
                          onPressed: () {
                            Navigator.push(
                                context, FlutterScaleRoute(page: HomePage()));
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.021,
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
                                  context, FlutterScaleRoute(page: SignUp()));
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.021,
                      ),
                      Text("Or Sign up with"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {},
                        // mini: true,
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        onPressed: () {},
                        // mini: true,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
