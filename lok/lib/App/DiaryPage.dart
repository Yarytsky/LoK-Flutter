import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/style.dart';

const List<String> termList = <String>[
  'Mathematical analysis',
  '1',
  '2',
];

class DiaryPage extends StatefulWidget {
  final String name;
  final String description;

  const DiaryPage({Key? key, required this.name, required this.description})
      : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    String? termDropdownValue = termList.first;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(
            appBarText: '',
          ),
        ),
        drawer: BaseDrawler(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: PrimaryPurple1,
                    ),
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.center,
                      value: termDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      dropdownColor: BaseWhite,
                      elevation: 16,
                      style: const TextStyle(color: BaseWhite),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          termDropdownValue = value!;
                          print(termDropdownValue);
                        });
                      },
                      items: termList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                value,
                                style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                ),
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Image(
                image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/03/66/54/56/360_F_366545675_F8yauzlroVONS25PuOP0oT1z5YRFxO63.jpg'),
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, top: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.name}',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: BaseBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Base20,
                height: 91.0,
                width: double.infinity,
              ),
            ),
            Center(
              child: Container(
                color: PrimaryPurple5,
                width: double.infinity,
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 21, top: 16,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            Center(
              child: Container(
                color: Base20,
                width: double.infinity,
                height: 169.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
              ),
            ),
            Center(
              child: Container(
                color: PrimaryPurple5,
                width: double.infinity,
                height: 16.0,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          color: Base30,
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Theme 1: Occasional Events',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: BaseBlack,
                                    ),
                                  ),
                                  Text(
                                    "Lecture ",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Base90,
                                    ),
                                  ),
                                  Text(
                                    "Practice",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Base90,
                                    ),
                                  ),
                                  Text(
                                    "Video",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Base90,
                                    ),
                                  ),
                                  Text(
                                    "Homework",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Base90,
                                    ),
                                  ),
                                  Text(
                                    'Test',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Base70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
