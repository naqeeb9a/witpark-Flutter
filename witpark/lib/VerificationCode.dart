import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/ResetPassword.dart';
import 'package:witpark/edit_profile.dart';

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot password',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1031,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Verification Code',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child:
                            Text('Please enter Verification code we sent to')),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('your number (03353961635)')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0644,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6162,
                  color: Colors.amber,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 40),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Enter the verification code",
                              style: TextStyle(fontSize: 20),
                            )),
                        spacer(context, 0.03),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextField(
                                  maxLength: 5,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Text("      -Enter the 5 digit code")
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.17,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text("Confirm"),
                            onPressed: () {
                              Navigator.push(context,
                                  FlutterScaleRoute(page: ResetPassword()));
                            })
                      ],
                    ),
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
