import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:lok/constants/colors.dart';

class BaseAppBar extends StatelessWidget {
  final String appBarText;
  const BaseAppBar({
    Key? key, required this.appBarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: BaseWhite,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(),
          Center(
            child: Text(appBarText,style: GoogleFonts.sourceSansPro(fontSize: 20,),),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: BaseOvalImg(height: 40,width: 40,),
          ),
        ],
      ),
    );
  }
}