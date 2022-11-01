import 'package:flutter/material.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/L&R/Register.dart';

class ChosePage extends StatefulWidget {
  const ChosePage({Key? key}) : super(key: key);

  @override
  State<ChosePage> createState() => _ChosePageState();
}

class _ChosePageState extends State<ChosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => SignInScreen(),
                    ),
                  );
                },
                child: Text('Login')
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => SignUpScreen(),
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
