import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:lok/constants/colors.dart';

class BaseAppBar extends StatefulWidget {
  final String appBarText;
  const BaseAppBar({
    Key? key, required this.appBarText,
  }) : super(key: key);

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
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
            child: Text(widget.appBarText,style: GoogleFonts.sourceSansPro(fontSize: 20,),),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => AccountPage(),
                    ),
                  );
                },
                child: BaseOvalImg(height: 40,width: 40, borderWidth: 3,)),
          ),
        ],
      ),
    );
  }
}