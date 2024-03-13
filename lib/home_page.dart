import 'package:flutter/material.dart';
import 'navigation_drawer.dart'; // Import the NavDrawer

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      drawer: NavDrawer(), // Drawer
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, I\'m Abhinav Srinivasan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Provides spacing between text and image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/Fire.png'),
            ),
            SizedBox(height: 20),
            Text(
              'This is my personal website where I share my stock picks, gaming interests, and more.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
