import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/constants/colors.dart';

class ProfileLineText extends StatelessWidget {
  final String TextOne;
  final String TextTwo;
  const ProfileLineText({
    Key? key, required this.TextOne, required this.TextTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(TextOne,style: GoogleFonts.sourceSansPro(
          color: Base50,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        )),
        Text(TextTwo, style: GoogleFonts.sourceSansPro(
          color: Base90,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),),
        SizedBox(height: 28,)
      ],
    );
  }
}