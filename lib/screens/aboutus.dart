import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Set drawer bars (hamburger icon) color to white
        ),
      ),
      body: SingleChildScrollView(
        child: Center(  // Wrap with Center widget
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // 90% of the screen width
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
                    text: 'IOT BASED MEDICAL KIOSK',
                    style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
                  ),
                  TextSpan(
                    text: '\n(CUI, Department of Physcics)',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\n\nSupervised By: ',
                    style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Sir Syed Raise Akram\n',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nStudent Name: ',
                    style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '\nGhufran Ali Khokhar\n(SP21-BEL-029)\nMuhammad Hussnain\n(SP21-BEL-015)',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ],
              ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png', // Replace with your logo's path
                          height: 80, // Adjust size as needed
                          width: 80,
                        ),
                        SizedBox(width: 10),
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
                leading: Icon(Icons.info),
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
