import 'package:flutter/material.dart';
import 'home_page.dart';
import 'stock_picks_page.dart';
import 'interests_page.dart';
import 'resume_page.dart';
//Imports are here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AS Weebsite', //placeholder
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/stock-picks': (context) => StockPicksPage(),
        '/interests': (context) => InterestsPage(),
        '/resume': (context) => ResumePage(),
        // Define other routes here
      },
    );
  }
}
