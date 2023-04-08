import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/Teacher/SubjectPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';

const List<String> courseList = <String>[
  'All Courses',
  'First',
  'Second',
  'Third',
  'Fourth'
];
const List<String> termList = <String>[
  'All term',
  '1',
  '2',
];

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({Key? key}) : super(key: key);

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends State<TeacherMainPage> {
  final myProducts = List<String>.generate(1000, (i) => 'Product $i');

  @override
  Widget build(BuildContext context) {
    String? courseDropdownValue = courseList.first;
    String? termDropdownValue = termList.first;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(
            appBarText: 'Subjects',
          ),
        ),
        drawer: BaseDrawler(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        TeacherSubjectPage();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                        child: Container(
                          height: 175,
                          decoration: BoxDecoration(
                            color: Base30,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image(
                                    image: NetworkImage(
                                        'https://t3.ftcdn.net/jpg/03/66/54/56/360_F_366545675_F8yauzlroVONS25PuOP0oT1z5YRFxO63.jpg'),
                                    fit: BoxFit.fitWidth,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                child: Column(
                                  children: [
                                    Text(
                                      'Математика',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: BaseBlack,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Groups:",
                                          style: GoogleFonts.sourceSansPro(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                          width:
                                              MediaQuery.of(context).size.width -
                                                  80,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Text(' ' + 'data');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
