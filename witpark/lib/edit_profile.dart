import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/d/d8/2014_Honda_City_%28GM6_MY14%29_VTi_sedan_%282015-07-15%29_01.jpg"),
                  maxRadius: 60,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "UserName", hintText: "Enter name"),
                      ),
                      TextField(
                        maxLength: 15,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "City",
                            hintText: "Enter City name where u live in"),
                      ),
                      TextField(
                        maxLength: 11,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Phone no",
                            hintText: "change phone number"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
