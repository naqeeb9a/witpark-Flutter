import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment',
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
            indent: 90,
            endIndent: 90,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  AutoSizeText(
                    "Payment : \n\n _________________ \n\n\n GST 5%: \n\n _________________ \n\n\n TotalPayment: \n\n ________________",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          ElevatedButton(
            onPressed: () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
            child: Text("Pay now"),
          )
        ])));
  }
}
