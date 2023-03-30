import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/constants/colors.dart';

class proposalCompanyName extends StatelessWidget {
  final String name;
  const proposalCompanyName({Key? key, required this.name,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment:Alignment.centerLeft,child: Text(name, style: GoogleFonts.sourceSansPro(fontSize: 32,fontWeight: FontWeight.w600,color: BaseBlack,),));
  }
}