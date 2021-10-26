import 'package:flutter/material.dart';
import 'package:senergy/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(null, 'Perfil'),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(color: Colors.red),
                height: 100,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(color: Colors.green),
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
