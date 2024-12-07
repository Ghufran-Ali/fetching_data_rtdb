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

  //state variable for health status
  String _bodyTempStatus = 'Normal';
  String _bloodpresureStatus = 'Normal';
  String _heartRateStatus = 'Normal';
  String _spo2Status = 'Normal';
  String _bmiStatus = 'Normal';
  String _weightStatus = 'Normal';

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      // Convert to lowercase for better matching
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

  //body temperature status
  String _getBodyTempStatus(double temp) {
    if (temp < 95.0) return 'Low';
    if (temp >= 97.0 && temp <= 99.0) return 'Normal';
    if (temp > 99.1 && temp <= 100.4) return 'Mild Fever';
    if (temp > 100.4 && temp <= 103.0) return 'High Fever';
    return 'Severe Fever';
  }

  //blood pressure status
  String _getBloodPressureStatus(double dbp) {
    if (dbp < 60) return 'Low';
    if (dbp >= 60 && dbp <= 80) return 'Normal';
    if (dbp > 80 && dbp <= 90) return 'Pre-Hypertension';
    return 'High';
  }

  //heart rate status
  String _getHeartRateStatus(double heartRate) {
    if (heartRate < 60) return 'Low';
    if (heartRate >= 60 && heartRate <= 100) return 'Normal';
    return 'High';
  }

  //spo2 status
  String _getSpO2Status(double spo2) {
    if (spo2 < 90) return 'Low';
    if (spo2 >= 90 && spo2 < 95) return 'Moderate';
    if (spo2 >= 95 && spo2 <= 100) return 'Normal';
    return 'High';
  }

  //weight status ranges in kg
  String _getWeightStatus(double weight) {
    if (weight < 45) return 'Underweight';
    if (weight >= 45 && weight < 75) return 'Normal';
    if (weight >= 75 && weight < 90) return 'Overweight';
    return 'Obese';
  }

//BMI status BMI ranges
  String _getBMIStatus(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi >= 18.5 && bmi < 25) return 'Normal';
    if (bmi >= 25 && bmi < 30) return 'Overweight';
    return 'Obese';
  }

//initializing the database for incoming value
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
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("IOT BASED MEDICAL KIOSK"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Card(
       
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sensor Readings:',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _SensorRow('Body Temperature', _bodytemp, '°F', _bodyTempStatus,
                    _getStatusColor(_bodyTempStatus)),
                _SensorRow(
                    'Blood Pressure (DBP)',
                    _dbp,
                    'mmHg',
                    _getBloodPressureStatus(_dbp),
                    _getStatusColor(_bloodpresureStatus)),
                _SensorRow('Heart Rate', _heartrate, 'BPM', _heartRateStatus,
                    _getStatusColor(_heartRateStatus)),
                _SensorRow('SpO2', _spo2, '%', _spo2Status,
                    _getStatusColor(_spo2Status)),
                _SensorRow('Weight ', _weight, 'kg', _weightStatus,
                    _getStatusColor(_weightStatus)),
                _SensorRow('BMI', _bmi, 'kg/m²', _bmiStatus,
                    _getStatusColor(_bmiStatus)),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }

  Widget _SensorRow(String label, double value, String unit, String status,
      Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
          Text(
            '$value $unit',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
