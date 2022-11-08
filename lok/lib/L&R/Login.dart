import 'dart:convert';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:lok/L&R/Register.dart';
import 'package:lok/L&R/recover.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? isEmailVal = false;
  bool? isPassVal = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(
        Uri.parse('https://localhost:7203/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'usernameOrEmail': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['accessToken']);
        print('Login successfully');
      } else {
        print('failed');
        print(emailController.text.runtimeType);
        print(emailController.text);
        print(passwordController.text);
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('logo.png'),
            ),
            SizedBox(
              height: 57,
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                onChanged: (newpValue) {
                  setState(() {
                    isEmailVal = EmailValidator.validate(newpValue);
                  });
                },
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF0F0F0),
                  hintText: 'Email',
                  hintStyle: GoogleFonts.sourceSansPro(),
                  prefixIcon: Icon(Icons.mail_outlined),
                  suffixIcon: Icon(
                    isEmailVal!
                        ? CupertinoIcons.check_mark_circled
                        : CupertinoIcons.multiply_circle,
                    color: isEmailVal! ? Colors.blue : Colors.red,
                  ),
                  // errorText: alfa,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                maxLength: 20,
                onChanged: (newValue) {
                  setState(() {
                    isPassVal;
                  });
                },
                validator: passwordValidator,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  counterText: '',
                  filled: true,
                  fillColor: Color(0xFFF0F0F0),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.sourceSansPro(),
                  prefixIcon: Icon(CupertinoIcons.lock),
                  suffixIcon: Icon(
                    isPassVal!
                        ? CupertinoIcons.check_mark_circled
                        : CupertinoIcons.multiply_circle,
                    color: isPassVal! ? Colors.blue : Colors.red,
                  ),
                  // errorText: alfa,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => recover(),
                    ),
                  );
                },
                child: Text(
                  'forgot your password?',
                  style: GoogleFonts.sourceSansPro(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text, passwordController.text);
              },
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                    color: Color(0xFF7678ED),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.sniglet(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => SignUpScreen(),
                  ),
                );
              },
              child: Text(
                'If you don’t have an accaunt',
                style: GoogleFonts.sniglet(
                  decoration: TextDecoration.underline,
                  color: Color(0xFFF35B04),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? passwordValidator(PassCurrentValue) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');
    var passNonNullValue = PassCurrentValue ?? "";
    if (passNonNullValue.isEmpty) {
      isPassVal = false;
      return ("Password is required");
    } else if (passNonNullValue.length < 12) {
      isPassVal = false;
      return ("Password Must be more than 12 characters");
    } else if (passNonNullValue.length > 20) {
      isPassVal = false;
      return ("Password Must be less than 20 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      isPassVal = false;
      return ("Password should contain upper, lower");
    }
    isPassVal = true;
    return null;
  }

  String? emailValidator(value) =>
      EmailValidator.validate(value!) ? null : "incorrect email";
}
