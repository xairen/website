import 'package:flutter/material.dart';

// 5T6SATLY9GEM1CE7

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Abhinav Srinivasan'),
            accountEmail: Text('abhinavsrini8@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/Fire.png',
                    width: 90, height: 90, fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/header.jpeg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text('Stock Picks'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/stock-picks'),
          ),
          ListTile(
            leading: Icon(Icons.games),
            title: Text('Gaming Interests'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/interests'),
          ),
          ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text('Resume'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/resume'),
          ),
          // Add more list tiles for other pages
        ],
      ),
    );
  }
}
