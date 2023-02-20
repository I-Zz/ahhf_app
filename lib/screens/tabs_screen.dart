import 'package:ahhf_app/screens/home.dart';
import 'package:ahhf_app/screens/profile_screen.dart';
import 'package:ahhf_app/screens/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'TabsPage';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  // List<Widget> _pages = [
  //   HomePage(),
  //   ProjectsScreen(),
  //   ProfileScreen(),
  // ];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      HomePage(),
      ProjectsScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        currentIndex: _selectedPageIndex,
        
        items: [
          BottomNavigationBarItem(
            icon: Row(
              children: <Widget>[
                const Spacer(),
                const Spacer(),
                Icon(Icons.home_outlined),
                Text('Home'),
                const Spacer(),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Row(
              children: <Widget>[
                const Spacer(),
                Icon(Icons.dashboard_outlined),
                Text('Projects'),
                const Spacer(),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Row(
              children: <Widget>[
                const Spacer(),
                Icon(Icons.account_circle_outlined),
                Text('Profile'),
                const Spacer(),
                const Spacer(),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
