import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen/main_bloc.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mainBloc = Provider.of<MainBloc>(context);
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
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          mainBloc.selectBottomTab.add(index);
        });
      },
    );
  }
}