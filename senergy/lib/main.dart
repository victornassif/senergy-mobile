import 'package:flutter/material.dart';
import 'package:senergy/screens/bottom_nav_screen.dart';
import 'package:senergy/config/theme.dart';

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();

const api_base_url = 'http://3579-2804-431-cfd4-3c02-e1e2-ab04-caf9-aed1.ngrok.io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SENERGY',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: BottomNavScreen(),
    );
  }
}