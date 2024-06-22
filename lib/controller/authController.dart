import 'package:firebase_auth/firebase_auth.dart';

class AuthFireBase {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register(String username, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
