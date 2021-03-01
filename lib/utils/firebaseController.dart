import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController extends StatelessWidget {

  void initializing() async {
    await Firebase.initializeApp();
  }

  void stateFirebase(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          print('User logged out');
        } else {
          print('User logged in');
          Navigator.pushReplacementNamed(context, '/news');
        }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void login({@required email, @required password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user not found');
      } else if (e.code == 'wrong-password') {
        print('wrong password');
      }
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirebaseController());
}

Widget registerUser({String email, String password, BuildContext context}) {
  return Container();
}

Widget stateChanges(BuildContext context) {
  return Container();
}
