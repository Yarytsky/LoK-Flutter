import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();


  void register(phoneNumber,userName,email,password,firstName,lastname) async {

    try{
      var data = jsonEncode(<String, String>{
        "phoneNumber": phoneNumberController.text,
        "userName": userNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "firstName": firstNameController.text,
        "lastname": lastnameController.text,
      });
      print(data);
      Response response = await post(
        Uri.parse('https://localhost:7203/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,

      );

      if(response.statusCode == 200){
        print('hello');
        print('Login successfully');

      }else {
        print('failed');
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }
  void getsome() async {

    try{

      Response response = await get(
        Uri.parse('https://localhost:7203/getsome'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if(response.statusCode == 200){
        print(response);
        var data = jsonDecode(response.body);
        print(data);

      }else {
        print('failed');
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (child: Column(
        children: [
          TextFormField(
            controller: phoneNumberController,
          ),
          TextFormField(
            controller: userNameController,
          ),
          TextFormField(
            controller: emailController,
          ),
          TextFormField(
            controller: passwordController,
          ),
          TextFormField(
            controller: firstNameController,
          ),
          TextFormField(
            controller: lastnameController,
          ),
          ElevatedButton(
              onPressed: (){

                register(phoneNumberController.text, userNameController.text, emailController.text, passwordController.text, firstNameController.text, lastnameController.text);
              },
              child: Text("Reg")
          ),
          GestureDetector(
            onTap: (){
              getsome();
            },
            child: Container(
              color: Colors.red,
              width: 100,
              height: 50,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
