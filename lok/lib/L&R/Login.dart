import 'package:flutter/material.dart';
import 'package:lok/App/MainPage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => MainPage(),
                    ),
                  );
                },
                child: Text('Login')
            ),
          ],
        ),
      ),
    );
  }
}
