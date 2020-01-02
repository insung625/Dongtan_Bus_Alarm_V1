import 'package:dongtan_bus_alarm/ui/alarm_set_page.dart';
import 'package:dongtan_bus_alarm/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/SetAlarm': (_) => AlarmSetPage(),
      },
    );
  }
}
