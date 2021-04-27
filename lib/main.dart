

import 'package:flutter/material.dart';
import 'package:flutter_app/login/loginProvider.dart';

import 'package:flutter_app/login/login_page.dart';
import 'package:provider/provider.dart';
import 'courseinfo/Courseinfo.dart';
import 'home/Home.dart';
import 'member/Member.dart';

void main() {
  //注入LoginProvider
  runApp(ChangeNotifierProvider(
    create: (context) => LoginProvider(),
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'my flutter',
      ),
      //Navigator.pushNamed 前置
      initialRoute: '/',
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => MyHomePage(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  int pageIndex = 0;
  final pages = [
    Home(),
    Courseinfo(),
    Member(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '最新消息'),
          BottomNavigationBarItem(
              icon: Icon(Icons.signal_wifi_4_bar_lock_outlined), label: '會員中心'),

        ],
        fixedColor: Colors.amber,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adb),
        onPressed: () {
          setState(() {
            count += 1;
            print(count);
          });
        },
      ),
    );
  }
}
