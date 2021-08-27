import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VechiclesCards extends StatefulWidget {
  String vname;
  String vmodel;
  String vnoplate;
  String vcolor;
  VechiclesCards({this.vname, this.vmodel, this.vnoplate, this.vcolor});
  @override
  _VechiclesCardsState createState() =>
      _VechiclesCardsState(vname, vmodel, vnoplate, vcolor);
}

class _VechiclesCardsState extends State<VechiclesCards>
    with SingleTickerProviderStateMixin {
  String vname;
  String vmodel;
  String vnoplate;
  String vcolor;
  _VechiclesCardsState(this.vname, this.vmodel, this.vnoplate, this.vcolor);
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Timer(Duration(milliseconds: 200), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
          .animate(_animationController),
      child: FadeTransition(
        opacity: _animationController,
        child: Container(
          width: double.infinity,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12)),
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "$vname \n$vmodel model\n$vcolor",
                          style: TextStyle(fontSize: 15),
                        ),
                        AutoSizeText(
                          '$vnoplate',
                          style: TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            )
          ]),
        ),
      ),
    );
  }
}
