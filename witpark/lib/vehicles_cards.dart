import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class VechiclesCards extends StatefulWidget {
  @override
  _VechiclesCardsState createState() => _VechiclesCardsState();
}

class _VechiclesCardsState extends State<VechiclesCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.height * 0.025,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                border: new Border.all(
                  color: Colors.black,
                  width: 2.5,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CircleAvatar(
                        maxRadius: (50),
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/d/d8/2014_Honda_City_%28GM6_MY14%29_VTi_sedan_%282015-07-15%29_01.jpg"),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "City \n 2018 model \n Honda",
                            style: TextStyle(fontSize: 15),
                          ),
                          AutoSizeText('LEF-207')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        )
      ]),
    );
  }
}
