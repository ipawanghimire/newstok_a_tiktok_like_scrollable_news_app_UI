import 'package:flutter/material.dart';
import 'package:newstok/constants/appcolor.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.purple),
            child: Text('Menu'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Handle menu item tap for Home
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('Trending'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Handle menu item tap for Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Following'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Handle menu item tap for Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Handle menu item tap for Settings
            },
          ),
          // Add more menu items here...
        ],
      ),
    );
  }
}
