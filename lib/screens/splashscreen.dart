import 'package:flutter/material.dart';
import 'dart:async';
import 'package:MedicalKiosk/screens/homescreen.dart'; // Import the home screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 9), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homescreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow, // Background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Splash Screen Image
              Image.asset(
                'assets/images/logo.png', // Add your splash logo image to assets
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              // Text below the image
              Text(
                'Medical Kiosk',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}