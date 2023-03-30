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
import 'StatisticsPage.dart';

class GroupStatisticsPage extends StatefulWidget {
  final String cardTitle;
  final String cardSubtitle;

  GroupStatisticsPage({required this.cardTitle, required this.cardSubtitle});

  @override
  _GroupStatisticsPageState createState() => _GroupStatisticsPageState();
}

double selectedStudentAttendancePercentage = 0.0;
String selectedStudentAttendanceText = '';
double selectedStudentGradePercentage = 0.0;
String selectedStudentGradeText = '';

double calculateGeneralValue(double grade, double attendance) {
  const double gradeWeight = 0.7;
  const double attendanceWeight = 0.3;
  return grade * gradeWeight + attendance * attendanceWeight;
}

int _selectedIndex = -1; // Set the initial value to -1 (none selected)

List<double> percentages = [0.75, 0.5, 0.92, 0.33, 0.64];

class _GroupStatisticsPageState extends State<GroupStatisticsPage> {
  List<Map<String, dynamic>> students = [
    {
      'name': 'Meshkova Inna',
      'grade': 35,
      'attendance': '100%',
      'image': 'assets/students/Rectangle264me.png'
    },
    {
      'name': 'Bublikov Kirill',
      'grade': 22,
      'attendance': '76%',
      'image': 'assets/students/Rectangle265BU.png'
    },
    {
      'name': 'Terlak Bohdan',
      'grade': 90,
      'attendance': '87%',
      'image': 'assets/students/Rectangle266TE.png'
    },
    {
      'name': 'Barabash Diana',
      'grade': 40,
      'attendance': '94%',
      'image': 'assets/students/Rectangle267BA.png'
    },
    {
      'name': 'Redia Maksym',
      'grade': 14,
      'attendance': '43%',
      'image': 'assets/students/Rectangle268RE.png'
    },
    {
      'name': 'Sheikina Viktoria',
      'grade': 32,
      'attendance': '55%',
      'image': 'assets/students/Rectangle269SHE.png'
    },
    {
      'name': 'Yarytsky Yuriy',
      'grade': 36,
      'attendance': '76%',
      'image': 'assets/students/Rectangle270YA.png'
    },
    {
      'name': 'Pasternak Lidia',
      'grade': 22,
      'attendance': '78%',
      'image': 'assets/students/Rectangle271PA.png'
    },
    {
      'name': 'Ryzhnitski Oleksandr',
      'grade': 19,
      'attendance': '99%',
      'image': 'assets/students/Rectangle272RY.png'
    },
    {
      'name': 'Pryimak Roman',
      'grade': 10,
      'attendance': '87%',
      'image': 'assets/students/Rectangle273PR.png'
    },
    {
      'name': 'Iskiv Mykhailo',
      'grade': 33,
      'attendance': '43%',
      'image': 'assets/students/Rectangle274IS.png'
    },
  ];

  void updateSelectedStudent(int index) {
    setState(() {
      selectedStudentGradePercentage = students[index]['grade'] / 100;
      selectedStudentGradeText = '${students[index]['grade']}/100';
      selectedStudentAttendancePercentage =
          int.parse(students[index]['attendance'].replaceAll('%', '')) / 100;
      selectedStudentAttendanceText = '${students[index]['attendance']}';
      _selectedIndex = index;
    });
  }

  void _showSubjectDetails() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Отримання розміру екрана
        final screenWidth = MediaQuery.of(context).size.width;

        return Stack(
          children: [
            // Розмиття заднього фону
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
            // Відображення діалогового вікна
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Container(
                width: screenWidth *
                    0.8, // Встановлення ширини як 80% від ширини екрана
                child: SingleChildScrollView(
                  // Додано SingleChildScrollView
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cardTitle,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 77 / 2,
                            backgroundImage: AssetImage(
                                'assets/images/avatar.png'), // Замініть на відповідне зображення
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            // Застосування Flexible для текстових віджетів
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.cardSubtitle,
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 14)),
                                Text('Mathematical analysis',
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 14)),
                                Text(
                                    'Probability theory and mathematical statistics',
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Groups learning the subject:',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('3cs - 21',
                          style: GoogleFonts.sourceSansPro(fontSize: 14)),
                      Text('4cs - 21',
                          style: GoogleFonts.sourceSansPro(fontSize: 14)),
                      Text('4cs - 22',
                          style: GoogleFonts.sourceSansPro(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildExclamationButton() {
    return InkWell(
      onTap: _showSubjectDetails,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                value: 1,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Base90),
              ),
            ),
            Center(
              child: Text(
                '!',
                style: GoogleFonts.sourceSansPro(
                  color: Base90,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String subtitle, double percentage) {
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
        color: Base30,
        margin: EdgeInsets.only(
            top: 16), // Додайте цей рядок для видалення відступів
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Змініть радіус на 0
        ),
        child: Container(
          height: 171,
          child: Column(
            children: [
              Container(
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.zero, // Змініть радіус на 0
                  child: Image.asset(
                    'assets/images/Frame19.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Container(
                height: 91,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 0.0,
                    bottom: 0.0,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height:
                                    16), // <-- Доданий відступ між заголовками
                            Text(
                              subtitle,
                              style: GoogleFonts.sourceSansPro(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, right: 20, bottom: 47),
                        child: buildExclamationButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      fontWeight: FontWeight.w600,
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
        drawer: BaseDrawler(), // Встановлено аппбар згідно з вимогами
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: buildCard(
                  widget.cardTitle,
                  widget.cardSubtitle,
                  0.0, // Це значення не використовується в цьому екрані
                ),
              ),
              Container(
                height: 52.0,
                color: Base20, // Задайте колір фону тут
                child: Padding(
                  padding: EdgeInsets.only(left: 23, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your statistics',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: BaseBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 169.0,
                color: BaseWhite,
                child: Row(
                  children: [
                    buildGeneralContainer(),
                    buildDivider(),
                    buildCustomContainer("Grade", Colors.green),
                    buildDivider(),
                    buildCustomContainertwo("Attendance", Colors.red),
                  ],
                ),
              ),
              Container(
                height: 52.0,
                color: Base20, // Задайте колір фону тут
                child: Padding(
                  padding: EdgeInsets.only(left: 23, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Group statistics',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: BaseBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text('№',
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 40),
                    Expanded(
                      child: Text('Full Name',
                          style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 20),
                    Text('Grade',
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 20),
                    Text('Attendance',
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: students.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      updateSelectedStudent(index);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      child: Row(
                        children: [
                          Text('${index + 1}'),
                          SizedBox(
                              width:
                                  10), // Added a SizedBox to add some space between number and avatar
                          CircleAvatar(
                            // Added CircleAvatar widget
                            radius: 18.0,
                            backgroundImage: AssetImage(students[index]
                                    ['image'] ??
                                ''), // Use the null-aware operator (??) to provide an empty string if the value is null
                          ),
                          SizedBox(
                              width:
                                  22), // Adjusted the width of the SizedBox to account for the avatar
                          Expanded(
                            child: Text(
                              students[index]['name'] ?? '',
                              style: GoogleFonts.sourceSansPro(
                                color: _selectedIndex == index
                                    ? PrimaryPurple1
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            '${students[index]['grade'] ?? ''}',
                            style: GoogleFonts.sourceSansPro(
                              color: _selectedIndex == index
                                  ? PrimaryPurple1
                                  : Colors.black,
                            ),
                          ),
                          SizedBox(width: 80),
                          Text(
                            '${students[index]['attendance'] ?? ''}',
                            style: GoogleFonts.sourceSansPro(
                              color: _selectedIndex == index
                                  ? PrimaryPurple1
                                  : Colors.black,
                            ),
                          ), // Use the null-aware operator (??) to provide an empty string if the value is null
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCustomContainer(String text, Color circleColor) {
  return Expanded(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 14, bottom: 8), // Add 14-pixel top padding
            child: Text(
              text,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          text == "Grade"
              ? CircularPercentIndicator(
                  radius: 44.5,
                  lineWidth: 18.0,
                  percent:
                      selectedStudentGradePercentage, // Use the variable here
                  center: Text(
                    selectedStudentGradeText, // Use the variable here
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  progressColor: getProgressColor(
                      selectedStudentGradePercentage), // Use getProgressColor here
                  backgroundColor:
                      Colors.transparent, // Make the background transparent
                )
              : Container(
                  width: 89,
                  height: 89,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                ),
        ],
      ),
    ),
  );
}

Widget buildCustomContainertwo(String text, Color circleColor) {
  return Expanded(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 14, bottom: 8), // Add 14-pixel top padding
            child: Text(
              text,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          text == "Attendance"
              ? CircularPercentIndicator(
                  radius: 44.5,
                  lineWidth: 18.0,
                  percent:
                      selectedStudentAttendancePercentage, // Use the variable here
                  center: Text(
                    selectedStudentAttendanceText, // Use the variable here
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  progressColor: getProgressColor(
                      selectedStudentAttendancePercentage), // Use getProgressColor here
                  backgroundColor:
                      Colors.transparent, // Make the background transparent
                )
              : Container(
                  width: 89,
                  height: 89,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                ),
        ],
      ),
    ),
  );
}

Widget buildGeneralContainer() {
  double value = calculateGeneralValue(
      selectedStudentGradePercentage, selectedStudentAttendancePercentage);
  String valueText = (value * 100).round().toString() + '%';

  return Expanded(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14, bottom: 8),
            child: Text(
              'General',
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          CircularPercentIndicator(
            radius: 44.5,
            lineWidth: 18.0,
            percent: value,
            center: Text(
              valueText,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            progressColor: getProgressColor(value),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    ),
  );
}

Color getProgressColor(double percentage) {
  if (percentage < 0.34) {
    return AdditionalRed;
  } else if (percentage < 0.67) {
    return AdditionalYellow;
  } else {
    return AdditionalGreen;
  }
}

Widget buildDivider() {
  return VerticalDivider(
    color: Colors.grey,
    thickness: 1,
    width: 1,
  );
}
