import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final myProducts = List<String>.generate(1000, (i) => 'Product $i');

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
                      color: SecondOrange2,
                    ),
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.center ,
                      value: courseDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      dropdownColor: Color(0xFFCECECE),
                      elevation: 16,
                      style: TextStyle(color: Color(0xFF676767)),
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
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text(value, style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.w400,fontSize: 24,),)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: SecondOrange4,
                    ),
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.center,
                      value: termDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      dropdownColor: Color(0xFFCECECE),
                      elevation: 16,
                      style: const TextStyle(color: Color(0xFF676767)),
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
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text(value, style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.w400,fontSize: 24,),)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
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
                                  Text(
                                    "Тут опис",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Base90,
                                    ),
                                  ),
                                  Text('Term 1',
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
