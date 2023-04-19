import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/Calendar.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/App/Proposal.dart';
import 'package:lok/App/Settings.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/Reusable%20Widgets/BaseDiveder.dart';
import 'package:lok/Reusable%20Widgets/DrawlerText.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/userSave.dart';

class BaseDrawler extends StatefulWidget {
  const BaseDrawler({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseDrawler> createState() => _BaseDrawlerState();
}

class _BaseDrawlerState extends State<BaseDrawler> {
  void logout() async {
    userId.replaceAll('', '');
    photo == null;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (contex) => SignInScreen(),
      ),
    );
  }

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
              DrawlerText(firstIcon: 'icons/Calendar.png', NavigatorPush: TableBasicsExample(),ButtonText: "Calendar",),
              DrawlerText(firstIcon: 'icons/ThumbsUp.png', NavigatorPush: ProposalPage(),ButtonText: "Proposals",),
              BaseDivider(),
              DrawlerText(firstIcon: 'icons/Translate.png', NavigatorPush: AccountPage(),ButtonText: "Language",),
              DrawlerText(firstIcon: 'icons/PencilSimple.png', NavigatorPush: AccountPage(),ButtonText: "Appearance",),
              DrawlerText(firstIcon: 'icons/Frame.png', NavigatorPush: Settings(),ButtonText: "Settings",),
              BaseDivider(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
            child: GestureDetector(
              onTap: (){
                logout();
              },
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