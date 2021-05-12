import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/FAQ.dart';
import 'package:witpark/edit_profile.dart';
import 'package:witpark/vehicles.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(children: [
              CircleAvatar(
                radius: 62,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/2853465978/a1f79511ee666f51a9eac8487bfd3220_400x400.png"),
                ),
              ),
              Positioned(
                top: 100,
                right: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, FlutterScaleRoute(page: EditProfile()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    height: MediaQuery.of(context).size.height * 0.025,
                    decoration: new BoxDecoration(
                      color: const Color(-1),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: Colors.black,
                        width: 2.5,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 104,
                  right: 23,
                  child: Icon(
                    Icons.edit,
                    size: 12,
                  ))
            ]),
          ),
          SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      child: Text(
                        "Name:\nEmail:\nNumber:\nCity:",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Naqeeb Ur Rehman\nnaqeeb9a@gmail.com\n03353961635\nlahore",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.67,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.white,
                child: Center(
                    child: Text(
                  "Vehicles",
                  style: TextStyle(fontSize: 20),
                )),
              ),
              onTap: () {
                Navigator.push(context, FlutterScaleRoute(page: Vehicles()));
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                Navigator.push(context, FlutterScaleRoute(page: FAQ()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.67,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.white,
                child: Center(
                    child: Text(
                  "FAQ",
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.67,
              height: MediaQuery.of(context).size.height * 0.05,
              color: Colors.white,
              child: Center(
                  child: Text(
                "About",
                style: TextStyle(fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
