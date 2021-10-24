import 'package:flutter/material.dart';
import 'package:senergy/screens/enviroments_screen.dart';
import 'package:senergy/screens/stats_screen.dart';
import 'package:senergy/screens/profile_screen.dart';
import 'package:senergy/screens/sensor_detail_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    StatsScreen(),
    SensorDetail(),
    EnviromentScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 0.0,
          items: [
            Icons.insert_chart,
            Icons.list_alt_rounded,
            Icons.living_outlined,
            Icons.person
          ]
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ));
  }
}
