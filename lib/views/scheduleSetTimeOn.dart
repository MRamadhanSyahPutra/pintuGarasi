import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleSetTimePagesOn extends StatefulWidget {
  const ScheduleSetTimePagesOn({Key? key}) : super(key: key);

  @override
  _ScheduleSetTimePagesOnState createState() => _ScheduleSetTimePagesOnState();
}

class _ScheduleSetTimePagesOnState extends State<ScheduleSetTimePagesOn> {
  DateTime selectedTime = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = DateTime(
          selectedTime.year,
          selectedTime.month,
          selectedTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8D8C4),
      appBar: AppBar(
        backgroundColor: Color(0xffE8D8C4),
        title: Text('Set Time On'),
      ),
      body: Center(
        // Letakkan widget di tengah-tengah secara horizontal
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Alarm Time:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat.Hm().format(selectedTime),
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk menyimpan waktu alarm
                  print(
                      'Opening Garage on ${DateFormat.Hm().format(selectedTime)}');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6C3428),
                    minimumSize: Size(140, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ScheduleSetTimePagesOn(),
  ));
}
