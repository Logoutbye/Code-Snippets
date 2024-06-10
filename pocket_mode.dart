
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isNear = false;
  double _accelerometerValueX = 0.0;
  double _accelerometerValueY = 0.0;
  double _accelerometerValueZ = 0.0;
  String _orientation = 'Unknown';

  @override
  void initState() {
    super.initState();

    // Proximity Sensor Listener
    ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = (event > 0); // event > 0 means something is close to the sensor
      });
    });

    // Accelerometer Listener
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValueX = event.x;
        _accelerometerValueY = event.y;
        _accelerometerValueZ = event.z;

        // Determine the orientation of the device
        if (_accelerometerValueZ.abs() > 9.0 && _accelerometerValueX.abs() < 2.0 && _accelerometerValueY.abs() < 2.0) {
          _orientation = 'Flat';
        } else if (_accelerometerValueX.abs() > 9.0 && _accelerometerValueY.abs() < 2.0 && _accelerometerValueZ.abs() < 2.0) {
          _orientation = _accelerometerValueX > 0 ? 'Left Side' : 'Right Side';
        } else if (_accelerometerValueY.abs() > 9.0 && _accelerometerValueX.abs() < 2.0 && _accelerometerValueZ.abs() < 2.0) {
          _orientation = _accelerometerValueY > 0 ? 'Upright' : 'Upside Down';
        } else {
          _orientation = 'Unknown';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isInPocketMode = _isNear &&
        ((_accelerometerValueZ.abs() > 9.0 && _accelerometerValueX.abs() < 2.0 && _accelerometerValueY.abs() < 2.0) || // Flat
         (_accelerometerValueX.abs() > 9.0 && _accelerometerValueY.abs() < 2.0 && _accelerometerValueZ.abs() < 2.0) || // Left or Right
         (_accelerometerValueY.abs() > 9.0 && _accelerometerValueX.abs() < 2.0 && _accelerometerValueZ.abs() < 2.0));  // Up or Down

    log('::: isInPocketMode $isInPocketMode');
    log('::: Orientation $_orientation');

    return Scaffold(
      appBar: AppBar(
        title: Text('Pocket Mode Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isInPocketMode ? 'In Pocket Mode' : 'Not in Pocket Mode',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Proximity: ${_isNear ? "Near" : "Far"}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Orientation: $_orientation',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Accelerometer X: $_accelerometerValueX',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Accelerometer Y: $_accelerometerValueY',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Accelerometer Z: $_accelerometerValueZ',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
