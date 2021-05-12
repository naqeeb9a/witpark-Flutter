import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FAQ',
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
        body: Container(
            child: Column(children: [
          Divider(
            color: Colors.black,
            thickness: 2,
            indent: 120,
            endIndent: 120,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    maxLength: 20,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: "Name",
                        hintText: "Enter your Name"),
                  ),
                  TextField(
                    maxLength: 30,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: "Email",
                        hintText: "Enter your Email"),
                  ),
                  TextField(
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter your Phone Number"),
                  ),
                  TextField(
                    maxLength: 150,
                    maxLines: 8,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: "Message",
                        hintText: "Enter Message you want to send"),
                  ),
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
              "Send",
              style: TextStyle(color: Colors.black),
            ),
          )
        ])));
  }
}
