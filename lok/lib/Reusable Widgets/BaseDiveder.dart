import 'package:flutter/material.dart';
import 'package:lok/constants/colors.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Divider(
          color: BaseBlack,
        ));
  }
}
