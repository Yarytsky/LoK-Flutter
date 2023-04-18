import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDiveder.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/style.dart';

class TeacherSubjectPage extends StatefulWidget {
  const TeacherSubjectPage({Key? key}) : super(key: key);

  @override
  State<TeacherSubjectPage> createState() => _TeacherSubjectPageState();
}

class _TeacherSubjectPageState extends State<TeacherSubjectPage> {
  @override
  Widget build(BuildContext context) {
    List<String> tempGrpList = <String>['3CS-21', '4CS-21', '4CS-22'];
    TextEditingController grpController = TextEditingController();
    String? tempVal = tempGrpList.first;

    int flexName = 4;
    int flex = 1;
    int flexGrade = 3;
    int flexAttendance = 3;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image(
                  image: NetworkImage(
                    'https://focus.ua/static/storage/thumbs/920x465/b/42/97c9d265-c31d2c43aadcbd194ec7df2f7981742b.jpg?v=8471_1',
                  ),
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                )),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Probability theory and mathematical statistics",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 24, fontWeight: FontWeight.w600, color: Base90),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: DropdownButtonFormField<String>(
                value: tempVal,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                dropdownColor: Color(0xFFCECECE),
                elevation: 16,
                style: const TextStyle(color: Color(0xFF676767)),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.abc),
                ),
                onChanged: (String? value) {
                  setState(() {
                    tempVal = value!;
                    grpController.text = value;
                    print(tempGrpList);
                  });
                },
                items: tempGrpList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            BaseDivider(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 23,vertical: 6),
                child: Text(
                  "Group Statistic",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: BaseBlack),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: flex,
                      child: Text(
                        '№',
                        style: sourcesansprostyle20w600BB,
                      )),
                  Expanded(
                      flex: flexName,
                      child: Text(
                        "Full Name",
                        style: sourcesansprostyle20w600BB,
                      )),
                  Expanded(
                      flex: flexGrade,
                      child: Center(
                        child: Text(
                          "Grade",
                          style: sourcesansprostyle20w600BB,
                        ),
                      )),
                  Expanded(
                      flex: flexAttendance,
                      child: Center(
                        child: Text(
                          "Attendance",
                          style: sourcesansprostyle20w600BB,
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                      child: Container(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: flex,
                                child: Text(
                                  '1',
                                  style: sourcesansprostyle20w600BB,
                                )),
                            Expanded(
                              flex: flexName,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://focus.ua/static/storage/thumbs/920x465/b/42/97c9d265-c31d2c43aadcbd194ec7df2f7981742b.jpg')),
                                  Text(
                                    'Name Name',
                                    style: sourcesansprostyle20w400B90,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: flexGrade,
                              child: Center(
                                child: Text(
                                  '35',
                                  style: sourcesansprostyle20w400B90,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: flexAttendance,
                              child: Center(
                                child: Text(
                                  '100%',
                                  style: sourcesansprostyle20w400B90,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
