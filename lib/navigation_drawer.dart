import 'package:flutter/material.dart';

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
                child: Image.asset('assets/profile.jpg',
                    width: 90, height: 90, fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/drawer_header_background.png'),
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
          // Add more list tiles for other pages
        ],
      ),
    );
  }
}
