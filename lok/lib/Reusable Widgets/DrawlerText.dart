import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/constants/colors.dart';

class DrawlerText extends StatelessWidget {
  final dynamic NavigatorPush;
  final String firstIcon;
  final String ButtonText;
  const DrawlerText({Key? key, required this.NavigatorPush, required this.firstIcon, required this.ButtonText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigatorPush),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(image: AssetImage(firstIcon)),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: Text(ButtonText,style: GoogleFonts.sourceSansPro(color: Base70,fontSize: 20,fontWeight: FontWeight.w600),)),
                ],
              ),
              Icon(Icons.keyboard_arrow_right,size: 24,color: Base70,),
            ],
          ),
        ),
      ),
    );
  }
}