import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';

import '../Reusable Widgets/BaseOvalImage.dart';
import '../constants/utils.dart';
import 'DiaryPage.dart';
import 'GroupStatisticsPage.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  get termDropdownValue => null;

  List<double> percentages = [0.75, 0.5, 0.92, 0.33, 0.64];

  Color getProgressColor(double percentage) {
    if (percentage < 0.34) {
      return AdditionalRed;
    } else if (percentage < 0.67) {
      return AdditionalYellow;
    } else {
      return AdditionalGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Base20,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: BaseWhite,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(''), // Видалено текст 'Statistics'
            flexibleSpace: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Statistics',
                    style: GoogleFonts.sourceSansPro(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: BaseOvalImg(
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: BaseDrawler(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                buildCard(
                    context, 'Project Managment', 'Kohut I.', percentages[0]),
                SizedBox(height: 16),
                buildCard(context, 'Mathematical analysis', 'Paburivska Nelia',
                    percentages[1]),
                SizedBox(height: 16),
                buildCard(
                    context, 'English', 'Paletska Antonina', percentages[2]),
                SizedBox(height: 16),
                buildCard(
                    context, 'Web Design', 'Solomka Olena', percentages[3]),
                SizedBox(height: 16),
                buildCard(context, 'Programming', 'Vengruniak Vitalik',
                    percentages[4]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCard(
    BuildContext context, String title, String subtitle, double percentage) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GroupStatisticsPage(
            cardTitle: title,
            cardSubtitle: subtitle,
          ),
        ),
      );
    },
    child: Card(
      margin: EdgeInsets.only(left: 8, right: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 171,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  'assets/images/Frame19.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height: 16), // <-- Доданий відступ між заголовками
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, right: 16, bottom: 0),
                    child: CircularPercentIndicator(
                      radius: 29.5,
                      lineWidth: 10.0,
                      percent: percentage,
                      center: Text(
                        '${(percentage * 100).toInt()}%',
                        style: TextStyle(fontSize: 14),
                      ),
                      progressColor: getProgressColor(percentage),
                      backgroundColor: BaseWhite,
                      circularStrokeCap:
                          CircularStrokeCap.butt, // Змінено на butt
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
