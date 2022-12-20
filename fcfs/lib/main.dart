import 'package:fcfs/genbill.dart';
import 'package:fcfs/table/table.dart';
import 'package:fcfs/table/testDouble.dart';
import 'package:fcfs/test/filo.dart';
import 'package:fcfs/test/view1only.dart';
import 'package:fcfs/test/view3.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dataTable',
      routes: {
        '/dataTable': (context) => DataTables(),
        '/genBill': (context) => genBill(),
        '/_View1State': (context) => View11(),
        '/_view3': (context) => View3(),
        '/intTest':(context) => doubleTest(),
      },
    );
  }
}