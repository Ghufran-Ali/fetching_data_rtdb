import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/login.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MedicalKiosk/screens/aboutus.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Spo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Oxygen Saturation Details",
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
          text: 'SpO2 measures the percentage of oxygen-saturated hemoglobin in the blood, which is crucial for ensuring adequate oxygen delivery to tissues.',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n\n- Normal Range: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '95% to 100%.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Below Normal (Mild Hypoxia): ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '90% to 94%.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Moderate Hypoxia: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '(85% to 89%) Requires medical attention.\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n- Severe Hypoxia: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '(Below 85%) Medical emergency.\n',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Reference()),
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
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sign Out'),
          onTap: () async {
            try {
              // Firebase and Google Sign-Out logic
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();

              // Navigate to Login Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            } catch (e) {
              // Error handling during sign-out
              print('Error signing out: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error during Sign-Out')),
              );
            }
          },
        ),
      ],
    ),
  ),
),
    );
  }
}
