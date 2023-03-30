import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/DiaryPage.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/App/Settings.dart';
import 'package:lok/Reusable%20Widgets/BaseDiveder.dart';
import 'package:lok/Reusable%20Widgets/DrawlerText.dart';
import 'package:lok/constants/colors.dart';

class BaseDrawler extends StatelessWidget {
  const BaseDrawler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image(image: AssetImage('assets/images/logo.png')),
              BaseDivider(),
              DrawlerText(
                firstIcon: 'assets/icons/House.png',
                NavigatorPush: MainPage(),
                ButtonText: "Main",
              ),
              DrawlerText(
                firstIcon: 'assets/icons/User.png',
                NavigatorPush: AccountPage(),
                ButtonText: "Profile",
              ),
              BaseDivider(),
              DrawlerText(
                firstIcon: 'assets/icons/Translate.png',
                NavigatorPush: AccountPage(),
                ButtonText: "Language",
              ),
              DrawlerText(
                firstIcon: 'assets/icons/PencilSimple.png',
                NavigatorPush: AccountPage(),
                ButtonText: "Appearance",
              ),
              DrawlerText(
                firstIcon: 'assets/icons/Frame.png',
                NavigatorPush: Settings(),
                ButtonText: "Settings",
              ),
              BaseDivider(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: GestureDetector(
              child: Row(
                children: [
                  Image(image: AssetImage('assets/icons/LogOut.png')),
                  SizedBox(
                      width:
                          5), // Add this SizedBox to create space between the icon and the text
                  Container(
                    width: 27.5, // Set the width of the container
                    child: Text(
                      "Log out",
                      style: GoogleFonts.sourceSansPro(
                          color: AdditionalBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
