import 'package:flutter/material.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';

class Apereance extends StatelessWidget {
  const Apereance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: BaseAppBar(
          appBarText: 'Coming soon',
        ),
      ),
      drawer: BaseDrawler(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator())
        ],
      ),
    ));
  }
}
