import 'package:flutter/material.dart';
import 'package:senergy/widgets/custom_app_bar.dart';

class SensorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(),
    );
  }
}
