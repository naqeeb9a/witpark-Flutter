import 'package:flutter/material.dart';
import 'package:flutter_transitions/flutter_transitions.dart';
import 'package:witpark/B_details.dart';

class BookingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, FlutterScaleRoute(page: BookingDetails()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/2853465978/a1f79511ee666f51a9eac8487bfd3220_400x400.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("tour to islamabad \n Rs. 3000"),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 12, top: 3, bottom: 3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("completed"),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 10,
                                ),
                                Text(
                                  "time ago",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
