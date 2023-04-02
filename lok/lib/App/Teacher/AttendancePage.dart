import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDiveder.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/style.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    List<String> tempGrpList = <String>['3CS-21', '4CS-21', '4CS-22'];

    TextEditingController grpController = TextEditingController();

    String? tempVal = tempGrpList.first;

    int flexName = 4;
    int flex = 1;
    int flexGrade = 3;
    int flexAttendance = 3;

    int _selectedCircleIndex = -1;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: BaseAppBar(
          appBarText: 'Attendance',
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
              style: sourcesansprostyle24w600B90,
            ),
          ),
          Row(
            children: [
              Expanded(
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
                  items:
                      tempGrpList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
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
                  items:
                      tempGrpList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          BaseDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: PrimaryPurple1,
                    width: 2,
                  )),
              child: Center(
                  child: Text(
                "12 January, Monday",
                style: sourcesansprostyle24w400B90,
              )),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Theme', style: sourcesansprostyle24w600BB)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Statistic and its probability distribution"),
                )),
                Image(image: AssetImage('icons/PencilSimple.png')),
              ],
            ),
          ),
          BaseDivider(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Group', style: sourcesansprostyle24w600BB)),
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
                    child: Text(
                  "Grade",
                  style: sourcesansprostyle20w600BB,
                )),
                Expanded(
                  flex: flexAttendance,
                    child: Text(
                  "Attendance",
                  style: sourcesansprostyle20w600BB,
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
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png')),
                                Text(
                                  'Name Name',
                                  style: sourcesansprostyle20w400B90,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: flexGrade,
                            child: Container(
                              width: 50,
                              height: 50,
                              child: DropdownButtonFormField<String>(
                                value: tempVal,
                                icon: const Icon(Icons.arrow_drop_down_rounded),
                                dropdownColor: Color(0xFFCECECE),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Color(0xFF676767)),
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
                                items: tempGrpList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: flexAttendance,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedCircleIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selectedCircleIndex == 0 ? Colors.blue : Colors.grey,
                                          width: 3,
                                        ),
                                        color: _selectedCircleIndex == 0 ? Colors.blue : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedCircleIndex = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selectedCircleIndex == 1 ? Colors.blue : Colors.grey,
                                          width: 3,
                                        ),
                                        color: _selectedCircleIndex == 1 ? Colors.blue : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedCircleIndex = 2;
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selectedCircleIndex == 2 ? Colors.blue : Colors.grey,
                                          width: 3,
                                        ),
                                        color: _selectedCircleIndex == 2 ? Colors.blue : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
