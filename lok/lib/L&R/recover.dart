import 'package:flutter/material.dart';
import 'package:lok/L&R/Login.dart';

class recover extends StatelessWidget {
  const recover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => SignInScreen(),
              ),
            );
          },
          child: Text('Back')
      ),
    );
  }
}
