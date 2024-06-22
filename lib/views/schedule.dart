import 'package:flutter/material.dart';
import 'package:sourcecode_project/views/scheduleSetTimeOff.dart';
import 'package:sourcecode_project/views/scheduleSetTimeOn.dart';

class SchedulePages extends StatefulWidget {
  const SchedulePages({Key? key}) : super(key: key);

  @override
  State<SchedulePages> createState() => _SchedulePagesState();
}

class _SchedulePagesState extends State<SchedulePages> {
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 235, 227, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 235, 227, 1),
        title: Text('Schedule Pages'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleSetTimePagesOn(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(67, 105, 107, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schedule 1:',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '08:00 AM',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'On',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Switch(
                          value: _isSwitched1,
                          onChanged: (bool value) {
                            setState(() {
                              _isSwitched1 = value;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleSetTimePagesOff(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(67, 105, 107, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schedule 2:',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '09:30 PM',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Off',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Switch(
                          value: _isSwitched2,
                          onChanged: (bool value) {
                            setState(() {
                              _isSwitched2 = value;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SchedulePages(),
  ));
}
