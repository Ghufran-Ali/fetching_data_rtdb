import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:flutter/material.dart';
import 'package:MedicalKiosk/screens/aboutus.dart';

class Bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Body Mass Index Details",
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
          text: 'BMI is a measure of body fat based on height and weight. It is a general indicator of whether a person has a healthy body weight. ',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n\n- Underweight: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: 'Below 18.5 kg/m².\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Normal Weight: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '18.5 to 24.9 kg/m².\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Overweight: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '25.0 to 29.9 kg/m².\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Obesity (Class 1): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '30.0 to 34.9 kg/m².\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Obesity (Class 2): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '35.0 to 39.9 kg/m².\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Severe Obesity (Class 3): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '40.0 kg/m² and above.',
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
