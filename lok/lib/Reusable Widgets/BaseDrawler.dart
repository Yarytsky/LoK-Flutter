import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/Appearance.dart';
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
              Image(image: AssetImage('assets/images/logo.png')),
              BaseDivider(),
              DrawlerText(firstIcon: 'assets/icons/House.png', NavigatorPush: MainPage(),ButtonText: "Main",),
              DrawlerText(firstIcon: 'assets/icons/User.png', NavigatorPush: AccountPage(),ButtonText: "Profile",),
              DrawlerText(firstIcon: 'assets/icons/Calendar.png', NavigatorPush: Apereance(),ButtonText: "Calendar",),
              DrawlerText(firstIcon: 'assets/icons/ThumbsUp.png', NavigatorPush: ProposalPage(),ButtonText: "Proposals",),
              BaseDivider(),
              DrawlerText(firstIcon: 'assets/icons/Translate.png', NavigatorPush: Apereance(),ButtonText: "Language",),
              DrawlerText(firstIcon: 'assets/icons/PencilSimple.png', NavigatorPush: Apereance(),ButtonText: "Appearance",),
              DrawlerText(firstIcon: 'assets/icons/Frame.png', NavigatorPush: Settings(),ButtonText: "Settings",),
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
                  Image(image: AssetImage('assets/icons/LogOut.png')),
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