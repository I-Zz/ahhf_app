import 'dart:io';
import 'package:flutter/material.dart';

class NavBarslider extends StatelessWidget {
  const NavBarslider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green.shade700, boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600, spreadRadius: 2, blurRadius: 25)
            ]),
            accountName: Text('UserName'),
            accountEmail: Text('Email Id'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/help2.jpeg'),
            ),
            currentAccountPictureSize: Size.square(80),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourite'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              exit(1);
            },
          ),
        ],
      ),
    );
  }
}
