import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:lok/L&R/Login.dart';

const List<String> genderList = <String>['Male', 'Famale', 'Other'];
const List<String> countryList = <String>['Ukraine', 'United Kingdom', 'Poland'];
const List<String> roleList = <String>['Student', 'Teacher', 'Hr', 'Admin'];


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstPasswordController = TextEditingController();
  TextEditingController secondPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  void register(phoneNumber, email, password, firstName, lastname, role) async {
    try {
      var data = jsonEncode(<String, String>{
        "phoneNumber": phoneNumberController.text,
        "email": emailController.text,
        "password": firstPasswordController.text,
        "firstName": firstNameController.text,
        "lastname": lastnameController.text,
        "Gender": genderController.text,
        "Country": countryController.text,
        "role": roleController.text,
      });
      print(data);
      Response response = await post(
        Uri.parse('https://localhost:7203/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,

      );

      if (response.statusCode == 200) {
        print('hello');
        print('Login successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => SignInScreen(),
          ),
        );
      } else {
        print('failed');
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    String? genderDropdownValue = genderList.first;
    String? counrtyDropdownValue = countryList.first;
    String? roleDropdownValue = roleList.first;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: SingleChildScrollView(
          child: Padding(
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
                    keyboardType: TextInputType.emailAddress,
                    //validator: emailValidator,
                    controller: firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Name',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(CupertinoIcons.person),
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
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
                    controller: lastnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Last name',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(CupertinoIcons.person),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField<String>(
                  value: counrtyDropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  dropdownColor: Color(0xFFCECECE),
                  elevation: 16,
                  style: const TextStyle(color: Color(0xFF676767)),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    prefixIcon: Icon(CupertinoIcons.placemark),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      counrtyDropdownValue = value!;
                      countryController.text = value;
                      print(counrtyDropdownValue);
                    });
                  },
                  items: countryList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Phone',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(CupertinoIcons.phone),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField<String>(
                  value: genderDropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  dropdownColor: Color(0xFFCECECE),
                  elevation: 16,
                  style: const TextStyle(color: Color(0xFF676767)),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    prefixIcon: Icon(CupertinoIcons.person_2),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      genderDropdownValue = value!;
                      genderController.text = value;
                      print(genderDropdownValue);
                    });
                  },
                  items: genderList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: emailValidator,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      counterText: '',
                      filled: true, fillColor: Color(0xFFF0F0F0),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(Icons.mail_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
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
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
                    controller: firstPasswordController,
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: (value) {
                      if (value != firstPasswordController.text) {
                        return "Passwords not equal";
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
                    controller: secondPasswordController,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Repeat password',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField<String>(
                  value: roleDropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  dropdownColor: Color(0xFFCECECE),
                  elevation: 16,
                  style: const TextStyle(color: Color(0xFF676767)),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    prefixIcon: Icon(CupertinoIcons.placemark),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      roleDropdownValue = value!;
                      roleController.text = value;
                      print(roleDropdownValue);
                    });
                  },
                  items: roleList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    register(phoneNumberController.text,emailController.text,
                        firstPasswordController.text, firstNameController.text,
                        lastnameController.text, roleController.text);
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: Color(0xFF7678ED),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        'SIGN UP',
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
                        builder: (contex) => SignInScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'If you  have  an account',
                    style: GoogleFonts.sniglet(
                      decoration: TextDecoration.underline,
                      color: Color(0xFFF35B04),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
