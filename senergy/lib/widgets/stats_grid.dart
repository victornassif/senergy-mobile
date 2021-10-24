import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                  '12,73',
                  'Gasto em reais',
                  'R\$',
                  Colors.yellow[300],
                  Theme.of(context).primaryColor,
                ),
                _buildStatCardkwh(
                  '120',
                  'Gasto em kWh',
                  'kWh',
                  Colors.yellow[300],
                  Theme.of(context).primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildStatCard(
      String count, String title, String fmt, Color color, Color colorText) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fmt,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    count,
                    style: TextStyle(
                      color:  Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildStatCardkwh(
      String count, String title, String fmt, Color color, Color colorText) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    count,
                    style: TextStyle(
                      color: colorText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    fmt,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
