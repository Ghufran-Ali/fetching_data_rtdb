import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:flutter/material.dart';
import 'package:MedicalKiosk/screens/aboutus.dart';

class Bloodpressure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Blood Pressure Details",
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
          text: 'Diastolic blood pressure is the pressure in the arteries when the heart rests between beats. It is an important measure of cardiovascular health. ',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n\n- Normal: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: 'Below 80 mmHg.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Elevated: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '(80 to 89 mmHg) Requires monitoring.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Stage 1 Hypertension: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '90 to 99 mmHg.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Stage 2 Hypertension: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '(100 mmHg or higher) Requires medical attention.\n',
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
