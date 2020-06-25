import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('ホーム'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('メニュー'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('スタンプ'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarms),
          title: Text('店舗'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}