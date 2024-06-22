import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sourcecode_project/views/aboutus.dart';
import 'package:sourcecode_project/views/home.dart';
import 'package:sourcecode_project/views/member.dart';
import 'package:sourcecode_project/views/user.dart';

class HistoryPages extends StatefulWidget {
  const HistoryPages({Key? key}) : super(key: key);

  @override
  State<HistoryPages> createState() => _HistoryPagesState();
}

class _HistoryPagesState extends State<HistoryPages> {
  bool hasActivity = false;
  final user = FirebaseAuth.instance.currentUser;

  String history = 'No Activity';
  String CekStatus = 'OFF';

  @override
  void initState() {
    super.initState();
    // Simulate fetching data from the backend

    Future.delayed(Duration(milliseconds: 1800), () {
      DatabaseReference historyRef =
          FirebaseDatabase.instance.ref('MotorServo/history');
      historyRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        setState(() {
          if (data != null) {
            history = data.toString();
            hasActivity = true;
            CekStatus = 'ON';
          } else {
            history = 'No Activity';
            hasActivity = false;
            CekStatus = 'OFF';
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: hasActivity
            ? // If there is activity, display activity details
            Container(
                child: Text(
                  'Status $CekStatus jam $history',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              )
            : // If there is no activity, display "No Activity"
            Text(
                history,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
      ),
    );
  }
}
