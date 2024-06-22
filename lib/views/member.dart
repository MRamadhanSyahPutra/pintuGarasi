import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sourcecode_project/views/aboutus.dart';
import 'package:sourcecode_project/views/history.dart';
import 'package:sourcecode_project/views/home.dart';
import 'package:sourcecode_project/views/user.dart';

class MemberPages extends StatefulWidget {
  const MemberPages({super.key});

  @override
  State<MemberPages> createState() => _MemberPagesState();
}

class _MemberPagesState extends State<MemberPages> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 235, 227, 1),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(19, 82, 87, 1),
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
        backgroundColor: Color.fromRGBO(19, 82, 87, 1),
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
    );
  }
}
