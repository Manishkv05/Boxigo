import 'package:boxigo/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<BottomNavigationBarItem> bottomitems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home'
  ),
   BottomNavigationBarItem(
    icon: Icon(Icons.filter_alt_sharp),
    label: 'Leads'
  ),
   BottomNavigationBarItem(
    icon: Icon(Icons.calendar_today_outlined),
    label: 'task'
  ),
   BottomNavigationBarItem(
    icon: Icon(Icons.pie_chart),
    label: 'Report'
  ),
   BottomNavigationBarItem(
    icon: Icon(Icons.more_horiz),
    label: 'More'
  ),

];

List<Widget> bottomnavscreen =<Widget>[
const dashboard(),
const dashboard(),
const Text('No Task'),
const Text('No Reports'),
const Text('Nothing t display here'),
];