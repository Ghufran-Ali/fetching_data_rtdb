//import 'package:MedicalKiosk/screens/homescreen.dart';
import 'package:MedicalKiosk/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:MedicalKiosk/screens/splashscreen.dart'; // Import the splash screen


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
   options: const FirebaseOptions
   (apiKey: "AIzaSyBmYCvYq3opk-dHL5iAlRGkm3VdFynDEMs", 
   appId: "1:1020733351793:android:3277238b6a8365065878d0",
    messagingSenderId: "1020733351793",
     projectId: "iot-based-mk",
     databaseURL: "https://iot-based-mk-default-rtdb.asia-southeast1.firebasedatabase.app")
  );
  runApp(const MyApp());
 // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Kiosk',
      theme: ThemeData(
      ),
home: SplashScreen(),
    );
  }
}
