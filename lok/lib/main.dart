import 'package:flutter/material.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/L&R/Login.dart';

import 'L&R/Login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

>>>>>>> Stashed changes
