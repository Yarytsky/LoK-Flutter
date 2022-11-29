import 'package:flutter/material.dart';
import 'package:lok/constants/colors.dart';

class BaseOvalImg extends StatelessWidget {
  final double width;
  final double height;
  const BaseOvalImg({Key? key,required this.width, required this.height,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy2ZxJbkYiT6D2XXUQtTl4nnUdNbWjPIMH_Q&usqp=CAU')),
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        border: Border.all(width: 6,color: AdditionalRed),
        color: Colors.redAccent,
      ),
    );
  }
}