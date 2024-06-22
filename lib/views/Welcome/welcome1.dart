import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sourcecode_project/views/Welcome/welcome2.dart';

class Welcome1 extends StatefulWidget {
  const Welcome1({super.key});

  @override
  State<Welcome1> createState() => _Welcome1State();
}

class _Welcome1State extends State<Welcome1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8D8C4),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Batik_Background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 60.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(19, 82, 78, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Selamat Datang di',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xfffffff5)),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'GarasiKu',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffffff5)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Aplikasi Mobile',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xfffffff5)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 1),
                    Text(
                      'Pembuka Pintu Garasi',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xfffffff5)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Welcome2(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromRGBO(19, 82, 78, 1),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Color(0xfffffff5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
