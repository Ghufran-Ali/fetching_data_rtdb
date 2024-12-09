import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/login.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:MedicalKiosk/screens/bodytemperature.dart';
import 'package:MedicalKiosk/screens/aboutus.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Height extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Height Details",
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
          text: 'Height is a key anthropometric measurement used to assess growth, development, and nutritional status. Height is also an important factor for calculating BMI.',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n\n- Normal Growth Patterns in Adults: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '\n   Average height for adult males: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '170 cm (5 ft 7 in) worldwide (varies by region).\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n   Average height for adult females: ',
          style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold), // Bold text
        ),
        TextSpan(
          text: '160 cm (5 ft 3 in) worldwide (varies by region).\n',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        TextSpan(
          text: '\n   Growth stops after the late teenage years in most individuals.\n',
          style: TextStyle(fontSize: 19, color: Colors.black), // Bold text
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
