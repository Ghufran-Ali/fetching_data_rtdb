// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final DatabaseReference _database = FirebaseDatabase.instance.ref("Sensors");
//   final TextEditingController _bodytempController = TextEditingController();
//   final TextEditingController _dbpController = TextEditingController();
//   final TextEditingController _heartrateController = TextEditingController();
//   final TextEditingController _spo2Controller = TextEditingController();
//   double _bodytemp = 0.0;
//   double _dbp = 0.0;
//   double _heartrate = 0.0;
//   double _spo2 = 0.0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _database.onValue.listen((DatabaseEvent event) {
//       print('Raw  database event:${event.snapshot.value}');
//       final data = event.snapshot.value;
//       print("data type: ${data.runtimeType}");
//       //final data = event.snapshot.value as Map<dynamic, dynamic>?;
//       if (data is Map) {
//         setState(() {
//           _bodytemp = double.tryParse(data['Body_Temp'].toString()) ?? 0;
//           _dbp = double.tryParse(data['DBP'].toString()) ?? 0;
//           _heartrate = double.tryParse(data['Heart_Rate'].toString()) ?? 0;
//           _spo2 = double.tryParse(data['SpO2'].toString()) ?? 0;
//         });
//       } else {
//         print("Unexpected data format: $data");
//       }
//     }, onError: (error) {
//       print("database error: $error");
//     });
//   }

// //helper method for safe parsing
//   double? _parsinDouble(dynamic value) {
//     if (value == null) return null;
//     if (value is double) return value;
//     if (value is int) return value.toDouble();
//     try {
//       return double.parse(value.toString());
//     } catch (e) {
//       print('Error parsing value: $value');
//       return null;
//     }
//   }

//   void _updateBodyTemp() {
//     _updateValue('Body_Temp', _bodytempController);
//   }

//   void _updateDBP() {
//     _updateValue('DBP', _dbpController);
//   }

//   void _updateHeartRate() {
//     _updateValue('Heart_Rate', _heartrateController);
//   }

//   void _updateSpo2() {
//     _updateValue('SpO2', _spo2Controller);
//   }

//   void _updateValue(String key, TextEditingController controller) {
//     if (controller.text.isNotEmpty) {
//       double? newValue = double.tryParse(controller.text);

//       if (newValue != null) {
//         print("Attempting to update $key with value: $newValue");

//         _database.update({key: newValue}).then((_) {
//           print("Successfully updated $key");
//           controller.clear();
//         }).catchError((error) {
//           print('Error updating $key: $error');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Failed to update'),
//             ),
//           );
//         });
//       }
//     }
//   }

//   void _updateAllValues() {
//     Map<String, double> updates = {};

//     if (_bodytempController.text.isNotEmpty) {
//       double? value = double.tryParse(_bodytempController.text);
//       if (value != null) updates['Body_Temp'] = value;
//     }

//     if (_dbpController.text.isNotEmpty) {
//       double? value = double.tryParse(_dbpController.text);
//       if (value != null) updates['DBP'] = value;
//     }

//     if (_heartrateController.text.isNotEmpty) {
//       double? value = double.tryParse(_heartrateController.text);
//       if (value != null) updates['Heart_Rate'] = value;
//     }

//     if (_spo2Controller.text.isNotEmpty) {
//       double? value = double.tryParse(_spo2Controller.text);
//       if (value != null) updates['SpO2'] = value;
//     }

//     if (updates.isNotEmpty) {
//       _database.update(updates).then((_) {
//         print("Successfully updated all values");
//         // Clear all controllers
//         _bodytempController.clear();
//         _dbpController.clear();
//         _heartrateController.clear();
//         _spo2Controller.clear();
//       }).catchError((error) {
//         print('Error updating values: $error');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to update values')),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("IOT BASED MEDICAL KIOSK"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(0.8),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Body Temperature:$_bodytemp'),
//               Text('dbp:$_dbp'),
//               Text('heart_rate:$_heartrate'),
//               Text('SpO2:$_spo2'),
//               SizedBox(height: 20),
//               TextField(
//                 controller: _bodytempController,
//                 decoration: InputDecoration(
//                   label: Text("New Body Temperature"),
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               TextField(
//                 controller: _heartrateController,
//                 decoration: InputDecoration(
//                   label: Text("New Heart Rate"),
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               TextField(
//                 controller: _dbpController,
//                 decoration: InputDecoration(
//                   label: Text("New DBP"),
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               TextField(
//                 controller: _spo2Controller,
//                 decoration: InputDecoration(
//                   label: Text("New SpO2"),
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               ElevatedButton(
//                   onPressed: _updateAllValues,
//                   child: Text("Update All Values")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _bodytempController.dispose();
//     _dbpController.dispose();
//     _heartrateController.dispose();
//     _spo2Controller.dispose();
//   }
// }

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final DatabaseReference _database = FirebaseDatabase.instance.ref("Sensors");

//   // State variables for sensor readings
//   double _bodytemp = 0.0;
//   double _dbp = 0.0;
//   double _heartrate = 0.0;
//   double _spo2 = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _database.onValue.listen((DatabaseEvent event) {
//       final dynamic data = event.snapshot.value;
//       if (data != null && data is Map) {
//         setState(() {
//           _bodytemp =
//               double.tryParse(data['Body_Temp']?.toString() ?? '0') ?? 0.0;
//           _dbp = double.tryParse(data['DBP']?.toString() ?? '0') ?? 0.0;
//           _heartrate =
//               double.tryParse(data['Heart_Rate']?.toString() ?? '0') ?? 0.0;
//           _spo2 = double.tryParse(data['SpO2']?.toString() ?? '0') ?? 0.0;
//           print(
//               'Data updated: BT:$_bodytemp, DBP:$_dbp, HR:$_heartrate, SpO2:$_spo2');
//         });
//       }
//     }, onError: (error) {
//       print('Database error: $error');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("IOT BASED MEDICAL KIOSK"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Sensor Readings:',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 Text('Body Temperature: $_bodytemp °C'),
//                 SizedBox(height: 8),
//                 Text('Blood Pressure (DBP): $_dbp mmHg'),
//                 SizedBox(height: 8),
//                 Text('Heart Rate: $_heartrate BPM'),
//                 SizedBox(height: 8),
//                 Text('SpO2: $_spo2 %'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//2nd

// import 'package:MedicalKiosk/screens/aboutus.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final DatabaseReference _database = FirebaseDatabase.instance.ref("Sensors");

//   // State variables for sensor readings
//   double _bodytemp = 0.0;
//   double _dbp = 0.0;
//   double _heartrate = 0.0;
//   double _spo2 = 0.0;
//   double _bmi = 0.0;
//   double _weight = 0.0;
//   double _heightinfeet = 0.0;
//   double _heightininches = 0.0;

//   // State variables for health status
//   String _bodyTempStatus = 'Normal';
//   String _bloodpresureStatus = 'Normal';
//   String _heartRateStatus = 'Normal';
//   String _spo2Status = 'Normal';
//   String _bmiStatus = 'Normal';
//   String _weightStatus = 'Normal';

//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'normal':
//         return Colors.green;
//       case 'high':
//       case 'fever':
//       case 'mild fever':
//       case 'high fever':
//       case 'very high fever':
//       case 'obese':
//       case 'overweight':
//       case 'pre-hypertension':
//         return Colors.red;
//       case 'low':
//       case 'underweight':
//         return Colors.orange;
//       case 'moderate':
//         return Colors.yellow;
//       default:
//         return Colors.black;
//     }
//   }

//   // Body temperature status
//   String _getBodyTempStatus(double temp) {
//     if (temp < 95.0) return 'Low';
//     if (temp >= 97.0 && temp <= 99.0) return 'Normal';
//     if (temp > 99.1 && temp <= 100.4) return 'Mild Fever';
//     if (temp > 100.4 && temp <= 103.0) return 'High Fever';
//     return 'Severe Fever';
//   }

//   // Blood pressure status
//   String _getBloodPressureStatus(double dbp) {
//     if (dbp < 60) return 'Low';
//     if (dbp >= 60 && dbp <= 80) return 'Normal';
//     if (dbp > 80 && dbp <= 90) return 'Pre-Hypertension';
//     return 'High';
//   }

//   // Heart rate status
//   String _getHeartRateStatus(double heartRate) {
//     if (heartRate < 60) return 'Low';
//     if (heartRate >= 60 && heartRate <= 100) return 'Normal';
//     return 'High';
//   }

//   // SpO2 status
//   String _getSpO2Status(double spo2) {
//     if (spo2 < 90) return 'Low';
//     if (spo2 >= 90 && spo2 < 95) return 'Moderate';
//     if (spo2 >= 95 && spo2 <= 100) return 'Normal';
//     return 'High';
//   }

//   // Weight status ranges in kg
//   String _getWeightStatus(double weight) {
//     if (weight < 45) return 'Underweight';
//     if (weight >= 45 && weight < 75) return 'Normal';
//     if (weight >= 75 && weight < 90) return 'Overweight';
//     return 'Obese';
//   }

//   // BMI status BMI ranges
//   String _getBMIStatus(double bmi) {
//     if (bmi < 18.5) return 'Underweight';
//     if (bmi >= 18.5 && bmi < 25) return 'Normal';
//     if (bmi >= 25 && bmi < 30) return 'Overweight';
//     return 'Obese';
//   }

//   // Initializing the database for incoming value
//   @override
//   void initState() {
//     super.initState();
//     _database.onValue.listen((DatabaseEvent event) {
//       final dynamic data = event.snapshot.value;
//       if (data != null && data is Map) {
//         setState(() {
//           _bodytemp =
//               double.tryParse(data['Body_Temp']?.toString() ?? '0') ?? 0.0;
//           _dbp = double.tryParse(data['DBP']?.toString() ?? '0') ?? 0.0;
//           _heartrate =
//               double.tryParse(data['Heart_Rate']?.toString() ?? '0') ?? 0.0;
//           _spo2 = double.tryParse(data['SpO2']?.toString() ?? '0') ?? 0.0;
//           _bmi = double.tryParse(data['BMI']?.toString() ?? '0') ?? 0.0;
//           _weight = double.tryParse(data['Weight']?.toString() ?? '0') ?? 0.0;
//           _heightinfeet =
//               double.tryParse(data['HeightInFeet']?.toString() ?? '0') ?? 0.0;
//           _heightininches =
//               double.tryParse(data['HeightInInches']?.toString() ?? '0') ?? 0.0;

//           _bodyTempStatus = _getBodyTempStatus(_bodytemp);
//           _bloodpresureStatus = _getBloodPressureStatus(_dbp);
//           _heartRateStatus = _getHeartRateStatus(_heartrate);
//           _spo2Status = _getSpO2Status(_spo2);
//           _weightStatus =
//               _getWeightStatus(_weight); // Make sure this is using _weight
//           _bmiStatus = _getBMIStatus(_bmi);

//           print('Data updated: BodyTemp:$_bodytemp ($_bodyTempStatus), '
//               'DBP:$_dbp ($_bloodpresureStatus), '
//               'HeartRate:$_heartrate ($_heartRateStatus), '
//               'SpO2:$_spo2 ($_spo2Status), '
//               'BMI:$_bmi ($_bmiStatus), '
//               'Weight:$_weight ($_weightStatus)');
//         });
//       }
//     }, onError: (error) {
//       print('Database error: $error');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: const Text(
//           "IOT BASED MEDICAL KIOSK",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18.0,
//           ),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(
//     color: Colors.white, // Set drawer bars (hamburger icon) color to white
//   ),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         padding: const EdgeInsets.all(10),
//         children: [
//           _buildSensorCard('Body Temperature', _bodytemp, '°F',
//               _bodyTempStatus, _getStatusColor(_bodyTempStatus), Icons.thermostat),
//           _buildSensorCard('Blood Pressure (DBP)', _dbp, 'mmHg',
//               _bloodpresureStatus, _getStatusColor(_bloodpresureStatus), Icons.monitor_heart),
//           _buildSensorCard('Heart Rate', _heartrate, 'bpm', _heartRateStatus,
//               _getStatusColor(_heartRateStatus), Icons.favorite),
//           _buildSensorCard('SpO2', _spo2, '%', _spo2Status,
//               _getStatusColor(_spo2Status), Icons.air),
//           _buildSensorCard('Height (Feet)', _heightinfeet, 'ft', '',
//               Colors.green, Icons.height),
//           _buildSensorCard('Height (Inches)', _heightininches, 'in', '',
//               Colors.green, Icons.height),
//           _buildSensorCard('Weight', _weight, 'kg', '',
//               Colors.blue, Icons.fitness_center),
//           _buildSensorCard('BMI', _bmi, 'kg/m²', _bmiStatus,
//               _getStatusColor(_bmiStatus), Icons.calculate),
//         ],
//       ),
//       drawer: Drawer(
//   child: Container(
//     color: Colors.white,
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           decoration: BoxDecoration(
//             color: Colors.purple,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
              
//               //SizedBox(height: 5),
//               Row(
//                 children: [
//                   Image.asset(
//                     'assets/images/logo.png', // Replace with your logo's path
//                     height: 80, // Adjust size as needed
//                     width: 80,
//                   ),
//                   SizedBox(width: 10), // Add space between logo and text
//                 ],
//               ),
//               Text(
//                 'Medical Kiosk',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.home),
//           title: Text('Home'),
//           onTap: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Homescreen()),
//             );
//           },
//         ),
//         //ListTile(
//           //leading: Icon(Icons.settings),
//           //title: Text('Settings'),
//          // onTap: () {},
//         //),
//         ListTile(
//           leading: Icon(Icons.info), // Optional: Use a relevant icon
//           title: Text('About Us'),
//           onTap: () {
//             // Add the action you want to perform when tapped
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Aboutus()),
//             );
//           },
//         ),
//       ],
//     ),
//   ),
// ),

//     );
//   }

//   Widget _buildSensorCard(String label, double value, String unit, String status,
//       Color statusColor, IconData icon) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 50,
//               color: statusColor,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 3),
//             Text(
//               '$value $unit',
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             if (status.isNotEmpty)
//               Text(
//                 status,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: statusColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:MedicalKiosk/screens/aboutus.dart';
import 'package:MedicalKiosk/screens/reference.dart';
import 'package:MedicalKiosk/screens/bodytemperature.dart';
import 'package:MedicalKiosk/screens/bloodpressure.dart';
import 'package:MedicalKiosk/screens/heartrate.dart';
import 'package:MedicalKiosk/screens/spo2.dart';
import 'package:MedicalKiosk/screens/bmi.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref("Sensors");

  // State variables for sensor readings
  double _bodytemp = 0.0;
  double _dbp = 0.0;
  double _heartrate = 0.0;
  double _spo2 = 0.0;
  double _bmi = 0.0;
  double _weight = 0.0;
  double _heightinfeet = 0.0;
  double _heightininches = 0.0;

  // State variables for health status
  String _bodyTempStatus = 'Normal';
  String _bloodpresureStatus = 'Normal';
  String _heartRateStatus = 'Normal';
  String _spo2Status = 'Normal';
  String _bmiStatus = 'Normal';
  String _weightStatus = 'Normal';

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'normal':
        return Colors.green;
      case 'high':
      case 'fever':
      case 'mild fever':
      case 'high fever':
      case 'very high fever':
      case 'obese':
      case 'overweight':
      case 'pre-hypertension':
        return Colors.red;
      case 'low':
      case 'underweight':
        return Colors.orange;
      case 'moderate':
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  // Body temperature status
  String _getBodyTempStatus(double temp) {
    if (temp < 95.0) return 'Low';
    if (temp >= 97.0 && temp <= 99.0) return 'Normal';
    if (temp > 99.1 && temp <= 100.4) return 'Mild Fever';
    if (temp > 100.4 && temp <= 103.0) return 'High Fever';
    return 'Severe Fever';
  }

  // Blood pressure status
  String _getBloodPressureStatus(double dbp) {
    if (dbp < 60) return 'Low';
    if (dbp >= 60 && dbp <= 80) return 'Normal';
    if (dbp > 80 && dbp <= 90) return 'Pre-Hypertension';
    return 'High';
  }

  // Heart rate status
  String _getHeartRateStatus(double heartRate) {
    if (heartRate < 60) return 'Low';
    if (heartRate >= 60 && heartRate <= 100) return 'Normal';
    return 'High';
  }

  // SpO2 status
  String _getSpO2Status(double spo2) {
    if (spo2 < 90) return 'Low';
    if (spo2 >= 90 && spo2 < 95) return 'Moderate';
    if (spo2 >= 95 && spo2 <= 100) return 'Normal';
    return 'High';
  }

  // Weight status ranges in kg
  String _getWeightStatus(double weight) {
    if (weight < 45) return 'Underweight';
    if (weight >= 45 && weight < 75) return 'Normal';
    if (weight >= 75 && weight < 90) return 'Overweight';
    return 'Obese';
  }

  // BMI status BMI ranges
  String _getBMIStatus(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi >= 18.5 && bmi < 25) return 'Normal';
    if (bmi >= 25 && bmi < 30) return 'Overweight';
    return 'Obese';
  }

  // Initializing the database for incoming value
  @override
  void initState() {
    super.initState();
    _database.onValue.listen((DatabaseEvent event) {
      final dynamic data = event.snapshot.value;
      if (data != null && data is Map) {
        setState(() {
          _bodytemp =
              double.tryParse(data['Body_Temp']?.toString() ?? '0') ?? 0.0;
          _dbp = double.tryParse(data['DBP']?.toString() ?? '0') ?? 0.0;
          _heartrate =
              double.tryParse(data['Heart_Rate']?.toString() ?? '0') ?? 0.0;
          _spo2 = double.tryParse(data['SpO2']?.toString() ?? '0') ?? 0.0;
          _bmi = double.tryParse(data['BMI']?.toString() ?? '0') ?? 0.0;
          _weight = double.tryParse(data['Weight']?.toString() ?? '0') ?? 0.0;
          _heightinfeet =
              double.tryParse(data['HeightInFeet']?.toString() ?? '0') ?? 0.0;
          _heightininches =
              double.tryParse(data['HeightInInches']?.toString() ?? '0') ?? 0.0;

          _bodyTempStatus = _getBodyTempStatus(_bodytemp);
          _bloodpresureStatus = _getBloodPressureStatus(_dbp);
          _heartRateStatus = _getHeartRateStatus(_heartrate);
          _spo2Status = _getSpO2Status(_spo2);
          _weightStatus =
              _getWeightStatus(_weight); // Make sure this is using _weight
          _bmiStatus = _getBMIStatus(_bmi);

          print('Data updated: BodyTemp:$_bodytemp ($_bodyTempStatus), '
              'DBP:$_dbp ($_bloodpresureStatus), '
              'HeartRate:$_heartrate ($_heartRateStatus), '
              'SpO2:$_spo2 ($_spo2Status), '
              'BMI:$_bmi ($_bmiStatus), '
              'Weight:$_weight ($_weightStatus)');
        });
      }
    }, onError: (error) {
      print('Database error: $error');
    });
  }
  

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "IOT BASED MEDICAL KIOSK",
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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: [
          _buildSensorCard('Body Temperature', _bodytemp,'°F', 
          _bodyTempStatus, _getStatusColor(_bodyTempStatus), Icons.thermostat,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bodytemperature()),
          ),
        ),
          _buildSensorCard('Blood Pressure (DBP)', _dbp, 'mmHg',
          _bloodpresureStatus, _getStatusColor(_bloodpresureStatus), Icons.monitor_heart,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bloodpressure()),
          ),
        ),
          _buildSensorCard('Heart Rate', _heartrate, 'bpm',
          _heartRateStatus, _getStatusColor(_heartRateStatus), Icons.favorite,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Heartrate()),
          ),
        ),
          _buildSensorCard('SpO2', _spo2, '%',
          _spo2Status, _getStatusColor(_spo2Status), Icons.air,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Spo2()),
          ),
        ),
          _buildSensorCard('Height (Feet)', _heightinfeet, 'ft', '',
              Colors.green, Icons.height,
              () => Navigator.push(
                 context,
            MaterialPageRoute(builder: (context) => Homescreen()),
              ),
          ),
          _buildSensorCard('Height (Inches)', _heightininches, 'in', '',
              Colors.green, Icons.height,
              () => Navigator.push(
                 context,
            MaterialPageRoute(builder: (context) => Homescreen()),
              ),
              ),
          _buildSensorCard('Weight', _weight, 'kg', '',
              Colors.blue, Icons.fitness_center,
              () => Navigator.push(
                 context,
            MaterialPageRoute(builder: (context) => Homescreen()),
              ),
              ),
          _buildSensorCard('BMI', _bmi, 'kg/m²',
          _bmiStatus, _getStatusColor(_bmiStatus), Icons.calculate,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bmi()),
          ),
        ),
        ],
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
              
              //SizedBox(height: 5),
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
        // Reference Screen Drawer Item
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
        //ListTile(
          //leading: Icon(Icons.settings),
          //title: Text('Settings'),
         // onTap: () {},
        //),
        ListTile(
          leading: Icon(Icons.info), // Optional: Use a relevant icon
          title: Text('About Us'),
          onTap: () {
            // Add the action you want to perform when tapped
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

 Widget _buildSensorCard(String label, double value, String unit, String status,
      Color statusColor, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: statusColor,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 3),
              Text(
                '$value $unit',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (status.isNotEmpty)
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 15,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}




