import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AddVehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            'Add Vehicles',
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
              child: Column(children: [
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 90,
              endIndent: 90,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Icon(
                    Icons.camera,
                    size: 60,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Car Name", hintText: "Enter car name"),
                    ),
                    TextField(
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Car Model",
                          hintText: "Enter car's year model"),
                    ),
                    TextField(
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Car Color",
                          hintText: "Enter car's color"),
                    ),
                    TextField(
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Number Plate",
                          hintText: "Enter car's number plate's number"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.black),
              ),
            )
          ])),
        ));
  }
}
