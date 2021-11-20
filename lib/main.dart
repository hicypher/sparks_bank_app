import 'package:bank_sparks/history.dart';
import 'package:bank_sparks/home.dart';
import 'package:bank_sparks/profile.dart';
import 'package:bank_sparks/screens/welcome.dart';
import 'package:bank_sparks/setting.dart';
import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _curIndex = 2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curIndex,
//          iconSize: 22.0,
          onTap: (index) {
            _curIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 0
                  ? 'images/ico_home_selected.png'
                  : 'images/ico_home.png'),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 1
                  ? 'images/ico_history_selected.png'
                  : 'images/ico_history.png'),
              title: Text(
                'History',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 2
                  ? 'images/ico_profile_selected.png'
                  : 'images/ico_profile.png'),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 3
                  ? 'images/ico_settings_selected.png'
                  : 'images/ico_settings.png'),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
      body: new Center(
        child: _getWidget(),
      ),
    );
  }

  Widget _getWidget() {
    switch (_curIndex) {
      case 0:
        return Container(
          color: Colors.red,
          child: HomePage(),
        );
        break;
      case 1:
        return Container(
          child: HistoryPage(),
        );
        break;
      case 2:
        return Container(
          child: ProfilePage(),
        );
        break;
      default:
        return Container(
          child: SettingsPage(),
        );
        break;
    }
  }
}