import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sourcecode_project/controller/authController.dart';
import 'package:sourcecode_project/views/auth/register.dart';
import 'package:sourcecode_project/widget/info.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginPages(),
    ),
  );
}

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final AuthFireBase _auth = AuthFireBase();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 235, 227, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: -20,
              left: -10,
              child: Image.asset(
                'assets/shape.png',
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              top: -20,
              right: -10,
              child: Image.asset(
                'assets/Logo-No-BG-1.png',
                width: 200,
                height: 200,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 200, left: 30, right: 30),
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Text(
                        'GarasiKu',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 100),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _email,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(67, 107, 105, 1),
                                contentPadding: EdgeInsets.all(20),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email wajib di isi!';
                                } else if (!value.contains('@gmail.com')) {
                                  return 'Email wajib mengandung @gmail.com';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: _password,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(67, 107, 105, 1),
                                contentPadding: EdgeInsets.all(20),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password wajib di isi!';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun? ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: SignInPages(),
                                      type: PageTransitionType.fade));
                            },
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(67, 107, 105, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromRGBO(67, 107, 105, 1),
                          ),
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xfffffff5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    String email = _email.text;
    String password = _password.text;

    User? user = await _auth.login(email, password);

    if (user != null) {
      print('Akun berhasil Login!');
      Info.snackbar(context, "Akun berhasil login!🫡");
      Future.delayed(Duration(milliseconds: 1700), () {
        context.pushReplacement('/beranda');
      });
    } else {
      Info.snackbar(context, "Akun gagal login!😕");
      print('Gagal login!');
    }
  }
}
