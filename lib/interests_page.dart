import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

class InterestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interests'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Text('Here are my interests.'),
      ),
    );
  }
}
