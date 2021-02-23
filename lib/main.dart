import 'package:flutter/material.dart';
import 'package:flutter_app/view/login_page.dart';
import 'package:flutter_app/view/news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginPage());
          case '/news':
            return MaterialPageRoute(builder: (context) => NewsPage());
          default:
            return null;
        }
      },
    );
  }
}
