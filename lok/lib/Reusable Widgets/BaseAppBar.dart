import 'package:flutter/material.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:lok/constants/colors.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PrimaryPurple1,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: BaseOvalImg(height: 40,width: 40,),
          ),
        ],
      ),
    );
  }
}