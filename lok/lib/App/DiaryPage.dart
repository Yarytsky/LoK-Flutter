import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/style.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Base20,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(
            appBarText: '',
          ),
        ),
        drawer: BaseDrawler(),
        body: Column(
          children: [
            Center(
              child: Image(
                image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/03/66/54/56/360_F_366545675_F8yauzlroVONS25PuOP0oT1z5YRFxO63.jpg'),
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(widget.name, style: sourcesansprostyle20w600BB,),
                      Text('Name Last', style: sourcesansprostyle16w400B90,),
                    ],
                  ),
                  Icon(Icons.info_outline),
                ],
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
