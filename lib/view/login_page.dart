import 'package:flutter/material.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/firebaseController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/utils/resize.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final FirebaseController _firebaseController = new FirebaseController();
  @override
  Widget build(BuildContext context) {
    _firebaseController.initializing();
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Stack(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/background.jpeg'),
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.softLight))),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: colorBlanco.withAlpha(50),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 5), blurRadius: 20)
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        'Welcome To',
                        style: GoogleFonts.signika(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Image.asset(
                        'assets/img/bit.png',
                        width: resizeH(mediaQ: _height, size: 157),
                        height: resizeH(mediaQ: _height, size: 43),
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'Please login to continue',
                        style: GoogleFonts.signika(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(children: <Widget>[
                            Material(
                              elevation: 2.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                controller: _email,
                                keyboardType: TextInputType.name,
                                enableSuggestions: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  hintText: 'Username',
                                  labelText: 'Username',
                                  prefixIcon: Icon(Icons.perm_identity_rounded),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Material(
                              elevation: 2.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                controller: _password,
                                obscureText: true,
                                enableSuggestions: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text('forgot password?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(height: 50.0),
                            RaisedButton(
                              onPressed: () {
                                if (_email.text.isEmpty ||
                                    _password.text.isEmpty) {
                                  print('error');
                                } else {
                                  _firebaseController.login(
                                      email: _email.text,
                                      password: _password.text);
                                  _firebaseController.stateFirebase(context);
                                }
                                // Navigator.pushReplacementNamed(
                                //     context, '/news');
                              },
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 150.0),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.grey)),
                              child: Text('Login',
                                  style: TextStyle(fontSize: 15.0)),
                            )
                          ]))
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text('OR',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                Expanded(
                  child: SizedBox(),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context, '/register');
                  },
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Text('Sing Up', style: TextStyle(fontSize: 20.0)),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
