import 'package:flutter/material.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/Calendar.dart';
import 'package:lok/App/DiaryPage.dart';
import 'package:lok/App/Teacher/GroupStatisticsPage.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/App/Proposal.dart';
import 'package:lok/App/Settings.dart';
import 'package:lok/App/Teacher/StatisticsPage.dart';
import 'package:lok/App/Teacher/AttendancePage.dart';
import 'package:lok/App/Teacher/MainPage.dart';
import 'package:lok/App/Teacher/SubjectPage.dart';
import 'package:lok/App/subjectPage.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/L&R/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

