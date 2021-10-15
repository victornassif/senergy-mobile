import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senergy/components/dashboard.component.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Color(0xFFF7F8FC),
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.phone_iphone)),
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.gear_big)),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: firstTabNavKey,
              builder: (BuildContext context) => DashboardView(),
            );
            break;
          case 1:
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              builder: (BuildContext context) => DevelopmentTab(),
            );
            break;
          case 2:
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) => DevelopmentTab(),
            );
            break;
          case 3:
            return CupertinoTabView(
              navigatorKey: fourthTabNavKey,
              builder: (BuildContext context) => DevelopmentTab(),
            );
            break;
        }

        return CupertinoTabView(
          navigatorKey: fourthTabNavKey,
          builder: (BuildContext context) => DashboardView(),
        );
      },
    );
  }
}

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
            backgroundColor: Colors.brown.shade800, child: const Text('AH')),
        middle: FlutterLogo(),
        trailing: Icon(Icons.search, color: Colors.grey),
      ),
      child: ListView(
        padding: EdgeInsets.fromLTRB(
            10, MediaQuery.of(context).size.height * 0.13, 10, 50),
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                width: 2,
                color: Color(0xFFDFE0EB),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consumo de Energia',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E4E6A)),
                  ),
                  Text(
                    '10 Ago 2021, 21:41 PM',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9FA2B4),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: SimpleTimeSeriesChart.withSampleData(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 17),
          Row(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFFDFE0EB),
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dispositivos Ativos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 22),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                          Text(
                            '/7',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFFDFE0EB),
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ambientes Ativos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 24),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        children: [
                          Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                          Text(
                            '/7',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFFDFE0EB),
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Estimativa de economia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 22),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'R\$',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                                fontSize: 20),
                          ),
                          Text(
                            '167,73',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFFDFE0EB),
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Maior consumo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 24),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        children: [
                          Text(
                            'Quarto do Artur',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1537 KW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DevelopmentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Color(0xFFFFDB00),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              10, MediaQuery.of(context).size.height * 0.40, 10, 10),
          child: Column(
            children: [
              Icon(
                Icons.delivery_dining_outlined,
                size: 50,
                color: Colors.black,
              ),
              Text(
                'A nosso aplicativo está em desenvolvimento!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Ainda existe muito por vir',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '#beSenergy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
