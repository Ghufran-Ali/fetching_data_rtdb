import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/login.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  child: Column(
    children: [
      // The existing container with RichText
      Center(
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
                  style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '\n(CUI, Department of Physics)',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
                TextSpan(
                  text: '\n\nSupervised By: ',
                  style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '\nMr. Syed Raise Akram\n',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
                TextSpan(
                  text: '\nStudent Name: ',
                  style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '\nGhufran Ali Khokhar\nMuhammad Hussnain',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),

      // Spacer for proper layout adjustment
      SizedBox(height: 20),

      // Logos side by side
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centers the logos horizontally
        children: [
          Image.asset(
            'assets/images/cuilogo.png', // Replace with your logo's path
            height: 80, // Adjust the size as needed
            width: 80,
          ),
          SizedBox(width: 20), // Space between the logos
          Image.asset(
            'assets/images/eielogo.jpeg', // Replace with your logo's path
            height: 80, // Adjust the size as needed
            width: 80,
          ),
        ],
      ),

      SizedBox(height: 20), // Optional: Space below the logos
    ],
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
