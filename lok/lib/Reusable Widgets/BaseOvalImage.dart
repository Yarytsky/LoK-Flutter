import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/constants/colors.dart';

class BaseOvalImg extends StatefulWidget {
  final double width;
  final double height;
  final double borderWidth;
  const BaseOvalImg({Key? key,required this.width, required this.height,required this.borderWidth,}) : super(key: key);

  @override
  State<BaseOvalImg> createState() => _BaseOvalImgState();
}

class _BaseOvalImgState extends State<BaseOvalImg> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://media.istockphoto.com/id/1075374570/vector/coming-soon.jpg?s=612x612&w=0&k=20&c=6W1rSRAoJnxtMSi98mGD7LjiXA3xQMotLn8hJnmXjzI=')),
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        border: Border.all(width: widget.borderWidth,color: AdditionalRed),
        color: Colors.redAccent,
      ),
    );
  }
}