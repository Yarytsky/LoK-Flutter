import 'dart:convert';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
<<<<<<< Updated upstream
=======
  bool isButtonVal = false;
>>>>>>> Stashed changes

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
                inputFormatters: [
<<<<<<< Updated upstream
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\s')),
=======
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
>>>>>>> Stashed changes
                ],
                maxLength: 20,
                onChanged: (newValue) {
                  setState(() {
                    isPassVal = validatePassword(newValue);
                  });
                },
<<<<<<< Updated upstream
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter password";
                  }else{
                    //call function to check password
                    bool result = validatePassword(value);
                    if(result){
                      // create account event
                      return null;
                    }else{
=======
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  } else {
                    bool result = validatePassword(value);
                    if (result) {
                      // create account event
                      return null;
                    } else {
>>>>>>> Stashed changes
                      return "Password should contain Capital, small letter";
                    }
                  }
                },
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
<<<<<<< Updated upstream
                    isPassVal! ? CupertinoIcons.check_mark_circled : CupertinoIcons.multiply_circle,
=======
                    isPassVal!
                        ? CupertinoIcons.check_mark_circled
                        : CupertinoIcons.multiply_circle,
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                    'Continue',
=======
                    'CONTINUE',
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
  //A function that validate user entered password
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
=======

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
>>>>>>> Stashed changes
      return false;
    }
  }

  String? emailValidator(value) =>
      EmailValidator.validate(value!) ? null : "incorrect email";
}
