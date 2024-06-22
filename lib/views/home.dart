import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sourcecode_project/views/aboutus.dart';
import 'package:sourcecode_project/views/history.dart';
import 'package:sourcecode_project/views/member.dart';
import 'package:sourcecode_project/views/schedule.dart';
import 'package:sourcecode_project/views/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSwitched = false;

  final user = FirebaseAuth.instance.currentUser;

  DatabaseReference database = FirebaseDatabase.instance.ref("MotorServo");

  @override
  Widget build(BuildContext context) {
    final pin = database.child('/pin');

    DateTime now = DateTime.now();
    String TimeNow = DateFormat('HH:mm').format(now);

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 235, 227, 1),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(19, 82, 78, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserPages()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  margin: EdgeInsets.only(left: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(67, 107, 105, 1),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  margin: EdgeInsets.only(left: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(67, 107, 105, 1),
                  ),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPages()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  margin: EdgeInsets.only(right: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(67, 107, 105, 1),
                  ),
                  child: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPages()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  margin: EdgeInsets.only(right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(67, 107, 105, 1),
                  ),
                  child: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(19, 82, 78, 1),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(67, 107, 105, 1),
            ),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 4),
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemberPages()),
                );
              },
            ),
          ),
        ],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome ${user?.email ?? "Pengguna"}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Kendalikan Garasimu',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 45),
            Center(
              child: Text(
                'HOME',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/Mask group 1.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Pintu Garasi',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Switch(
              value: _isSwitched,
              onChanged: (bool value) async {
                setState(() {
                  _isSwitched = value;
                });
                try {
                  final snapshot = await pin.get();
                  if (snapshot.exists) {
                    final value = snapshot.value;

                    if (_isSwitched && value == 0) {
                      await pin.set(1);
                      await database.child('/history').set(TimeNow);
                      print('MotorServo berhasil ON!');
                    } else if (!_isSwitched && value == 1) {
                      await pin.set(0);
                      await database.child('/history').set(TimeNow);
                      print('MotorServo berhasil OFF!');
                    } else {
                      print('Tidak ada perubahan');
                    }
                  } else {
                    print('Data tidak tersedia!');
                  }
                } catch (e) {
                  print('Terjadi kesalahan pada : $e');
                }
              },
              activeColor: Colors.green,
              inactiveTrackColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              _isSwitched ? 'Buka' : 'Tutup',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: _isSwitched ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(19, 82, 78, 1),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      icon: Icon(
                        Icons.schedule,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SchedulePages()),
                        );
                      },
                    ),
                    Text(
                      'Schedule',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchedulePages()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
