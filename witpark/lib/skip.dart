import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class Skip extends StatelessWidget {
  var para1 = "online booking";
  var para2 = "Advance booking";
  var para3 = "Nearby Available parking";
  var day3 = 60;
  var day10 = 50;
  var day20 = 40;
  var dayMore = 35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Witpark",
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.black))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        "Welcome to witpark",
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "                   The project is likely to resolve most commonly faced issue for travelers and people living with-in city which is parking where ever we go we face a problem where to park our car and it remains safe. So, what if we had a way to book a parking spot before reaching there so you don’t have to look for the parking spots yourself and just go there and park your car to the reserved spot.",
                          style: GoogleFonts.aBeeZee(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "See our parking Gallery",
                style: GoogleFonts.aBeeZee(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    initialPage: 0, autoPlay: true, enlargeCenterPage: true),
                items: [
                  img(context, "assets/hero-1.jpg"),
                  img(context, "assets/hero-2.jpg"),
                  img(context, "assets/hero-3.jpg"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
                indent: 80,
                endIndent: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Our key services",
                style: GoogleFonts.aBeeZee(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(
                    children: [
                      card1(context, "online booking", Icons.calendar_today),
                      card1(context, "Advance booking", Icons.book),
                      card1(context, "Nearby availible parking", Icons.map),
                      card1(context, "E-payment", Icons.money),
                      card1(context, "24/7 Service", Icons.twenty_four_mp)
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
                indent: 80,
                endIndent: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Prices we charge",
                style: GoogleFonts.aBeeZee(fontSize: 30),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView(
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("Rs $day3 "),
                      subtitle: Text("wholeday (3 days or less)"),
                      trailing: Icon(Icons.local_parking, color: Colors.white),
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("Rs $day10 "),
                      subtitle: Text("wholeday (10 days)"),
                      trailing: Icon(
                        Icons.local_parking,
                        color: Colors.white,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("Rs $day20 "),
                      subtitle: Text("wholeday (20 days)"),
                      trailing: Icon(Icons.local_parking, color: Colors.white),
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("Rs $dayMore "),
                      subtitle: Text("wholeday (20+ days)"),
                      trailing: Icon(Icons.local_parking, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Sign in to explore more ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(fontSize: 30),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ElevatedButton(
                child: Text("Sign in"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

img(BuildContext context, img) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.4,
    width: MediaQuery.of(context).size.width * 0.8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      semanticContainer: true,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    ),
  );
}

card1(BuildContext context, para1, icon1) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon1,
            color: Colors.amber,
            size: 80,
          ),
          AutoSizeText(para1,
              textAlign: TextAlign.center, style: GoogleFonts.aBeeZee()),
        ],
      ),
    ),
  );
}
