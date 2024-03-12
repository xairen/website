import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

class StockPicksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Picks'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Text('Here are my stock picks.'),
      ),
    );
  }
}
