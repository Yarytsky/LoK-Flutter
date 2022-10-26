import 'package:flutter/material.dart';
import 'package:lok/L&R/ChoosePage.dart';

import '../App/MainPage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            Column(
              children: [
                RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Other"),
                  value: "other",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => MainPage(),
                    ),
                  );
                },
                child: Text('Register')
            ),
          ],
        ),
      ),
    );
  }
}

