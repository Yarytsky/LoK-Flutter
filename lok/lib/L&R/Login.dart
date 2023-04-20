import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/L&R/Register.dart';
import 'package:lok/L&R/recover.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/user.dart';
import 'package:lok/constants/services/lokApiManager.dart';

import 'dart:convert';

import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? isEmailVal = false;
  bool? isPassVal = false;
  bool isButtonVal = false;
  bool isShow = true;

  TextEditingController emailController =
      TextEditingController(text: 'maxim.redya@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Password1!');

  void login(String email, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${MoviesApiService().dio.options.baseUrl}/auth/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phoneOrEmail': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => MainPage(),
          ),
        );
        print('Login successfully');
        Map<String, dynamic> payload = Jwt.parseJwt(data['accessToken']);
        userId = payload['id'];
        accesstoken = data['accessToken'];
        print("Access token: $accesstoken");
        print("Id: $userId");
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
              image: AssetImage('images/logo.png'),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: isEmailVal! ? Colors.blue : Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF0F0F0),
                  hintText: 'Email',
                  hintStyle: GoogleFonts.sourceSansPro(),
                  prefixIcon: Icon(Icons.mail_outlined),
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
                obscureText: isShow,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                maxLength: 20,
                onChanged: (newValue) {
                  setState(() {
                    isPassVal = validatePassword(newValue);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  } else {
                    bool result = validatePassword(value);
                    if (result) {
                      // create account event
                      return null;
                    } else {
                      return "Password should contain Capital, small letter";
                    }
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: isPassVal! ? Colors.blue : Colors.red),
                  ),
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
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isShow = !isShow;
                      });
                    },
                    icon:
                        Icon(isShow ? Icons.visibility : Icons.visibility_off),
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
            // ElevatedButton(
            //   onPressed: () {
            //     login(emailController.text, passwordController.text);
            //   },
            //   style: ElevatedButton.styleFrom(
            //
            //   ),
            //   child: Text(
            //     'CONTINUE',
            //     style: GoogleFonts.sniglet(
            //       color: Color(0xFFFFFFFF),
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
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
                    '',
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

  RegExp pass_valid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  String? emailValidator(value) =>
      EmailValidator.validate(value!) ? null : "incorrect email";
}
