import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/DiaryPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/subject.dart';
import 'package:lok/constants/services/lokApiManager.dart';
import 'package:lok/constants/style.dart';

const List<String> courseList = <String>['All Courses', 'First', 'Second', 'Third', 'Fourth'];
const List<String> termList = <String>['All term', '1', '2',];

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Subject> subjectsInfo = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    var popularMovies = await MoviesApiService().getSubjects();
    setState(() {
      subjectsInfo.addAll(popularMovies);
    });
  }

  Uint8List a(b) {
    Uint8List bytesImage = const Base64Decoder().convert(b);
    return bytesImage;
  }

  @override
  Widget build(BuildContext context) {
    String? courseDropdownValue = courseList.first;
    String? termDropdownValue = termList.first;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(appBarText: 'Subjects',),
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
                      alignment: Alignment.center ,
                      value: courseDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      dropdownColor: Base20,
                      elevation: 16,
                      style: sourcesansprostyle20w400B90,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          courseDropdownValue = value!;
                          print(courseDropdownValue);
                        });
                      },
                      items: courseList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text(value, style: sourcesansprostyle24w600BB)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: PrimaryPurple4,
                    ),
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.center,
                      value: termDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      dropdownColor: Base20,
                      elevation: 16,
                      style: sourcesansprostyle20w400B90,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          termDropdownValue = value!;
                          print(termDropdownValue);
                        });
                      },
                      items:
                      termList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text(value, style: sourcesansprostyle24w600BB)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: subjectsInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => DiaryPage(name: '${subjectsInfo[index].name}', description: '${subjectsInfo[index].description}',id: '${subjectsInfo[index].id}', image: '${subjectsInfo[index].image}',),
                          ),
                        );
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
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  child: Image.memory(
                                    a(subjectsInfo[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '${subjectsInfo[index].name}',
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: BaseBlack,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "${subjectsInfo[index].description}",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Base90,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Term 1',
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Base70,
                                  ),
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

