import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/Calendar.dart';
import 'package:lok/App/MainPage.dart';
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
              Image(image: AssetImage('images/logo.png')),
              BaseDivider(),
              DrawlerText(firstIcon: 'icons/House.png', NavigatorPush: MainPage(),ButtonText: "Main",),
              DrawlerText(firstIcon: 'icons/User.png', NavigatorPush: AccountPage(),ButtonText: "Profile",),
              DrawlerText(firstIcon: 'icons/Calendar.png', NavigatorPush: Calendar(),ButtonText: "Calendar",),
              BaseDivider(),
              DrawlerText(firstIcon: 'icons/Translate.png', NavigatorPush: AccountPage(),ButtonText: "Language",),
              DrawlerText(firstIcon: 'icons/PencilSimple.png', NavigatorPush: AccountPage(),ButtonText: "Appearance",),
              DrawlerText(firstIcon: 'icons/Frame.png', NavigatorPush: AccountPage(),ButtonText: "Settings",),
              BaseDivider(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
            child: GestureDetector(
              child: Row(
                children: [
                  Image(image: AssetImage('icons/LogOut.png')),
                  Text("Log out", style: GoogleFonts.sourceSansPro(color: AdditionalBlue,fontSize: 20,fontWeight: FontWeight.w600),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}