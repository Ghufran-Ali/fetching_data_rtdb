import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:flutter/material.dart';
//import 'package:MedicalKiosk/screens/bodytemperature.dart';
import 'package:MedicalKiosk/screens/aboutus.dart';

class Bodytemperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Body Temperature Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous screen
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set drawer bars (hamburger icon) color to white
        ),
      ),
      body: SingleChildScrollView(
  child: Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3), // Shadow position
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    child: RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: 'Body temperature is a vital sign that indicates the body\'s ability to generate and dissipate heat. Normal body temperature can vary slightly between individuals and depending on the time of day. ',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n\n- Low Body Temperature (Hypothermia): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: 'Below 95°F (35°C) Medical emergency if body loses heat faster than it produces.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Normal Body Temperature: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '97°F to 99°F (36.1°C to 37.2°C) Average is around 98.6°F (37°C).\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Elevated Body Temperature (Low-Grade Fever): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '99.1°F to 100.4°F (37.3°C to 38°C) Mildly elevated.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Fever: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '100.4°F to 103°F (38°C to 39.4°C) Indicates infection or illness.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Hyperpyrexia (Severe Fever): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: 'Above 104°F (40°C) Medical emergency.',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
      ],
    ),
  ),
  ),
),

      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png', // Replace with your logo's path
                          height: 80, // Adjust size as needed
                          width: 80,
                        ),
                        SizedBox(width: 10), // Add space between logo and text
                      ],
                    ),
                    Text(
                      'Medical Kiosk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                },
              ),
              ListTile(
          leading: Icon(Icons.book),
          title: Text('Reference'),
          onTap: () {
            // Navigate to the Reference screen here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Reference()), // Replace with your Reference screen widget
            );
          },
        ),
              ListTile(
                leading: Icon(Icons.info), // Optional: Use a relevant icon
                title: Text('About Us'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Aboutus()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
