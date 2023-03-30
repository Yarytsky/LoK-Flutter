import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:lok/Reusable%20Widgets/Charts.dart';
import 'package:lok/Reusable%20Widgets/ProfileLineText.dart';
import 'package:lok/constants/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(),
        ),
        drawer: BaseDrawler(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: GoogleFonts.sourceSansPro(
                          color: AdditionalBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    Image(image: AssetImage('icons/PencilSimple.png')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BaseOvalImg(
                    width: 120,
                    height: 120,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Name Name",
                              style: GoogleFonts.sourceSansPro(
                                  color: BaseBlack,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            '(Student)',
                            style: GoogleFonts.sourceSansPro(
                              color: Base50,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ProfileLineText(
                          TextOne: 'Phone Number: ', TextTwo: '+380999999999'),
                      ProfileLineText(
                          TextOne: 'Mail: ', TextTwo: 'NeTiko@gmail.com'),
                      ProfileLineText(TextOne: 'Gender: ', TextTwo: 'Woman'),
                      ProfileLineText(TextOne: 'Absense: ', TextTwo: '15'),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                  child: Text(
                    'Attendence chart',
                    style: GoogleFonts.sourceSansPro(
                      color: BaseBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),child: Text("Number% attendance",style: GoogleFonts.sourceSansPro(color: AdditionalBlue,fontSize: 24,fontWeight: FontWeight.w400),))),
              LineChartSample2(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                  child: Text(
                    'Progress',
                    style: GoogleFonts.sourceSansPro(
                      color: BaseBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),child: Text("Number GPA",style: GoogleFonts.sourceSansPro(color: AdditionalBlue,fontSize: 24,fontWeight: FontWeight.w400),))),
              LineChartSample2(),
            ],
          ),
        ),
      ),
    );
  }
}
