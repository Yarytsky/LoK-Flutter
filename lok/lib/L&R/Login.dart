import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://localhost:7203/signin'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'usernameOrEmail' : emailController.text,
            'password' : passwordController.text,
          }),
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body);
        print(data['accessToken']);
        print('Login successfully');

      }else {
        print('failed');
        print(emailController.text.runtimeType);
        print(emailController.text);
        print(passwordController.text);
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text, passwordController.text);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart';
// import 'package:lok/App/MainPage.dart';
// import 'package:lok/L&R/serverLogin.dart';
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//
//   var emailCntr = TextEditingController();
//   var passwordCntr = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up Api'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailCntr,
//               decoration: InputDecoration(
//                   hintText: 'Email'
//               ),
//             ),
//             SizedBox(height: 20,),
//             TextFormField(
//               controller: passwordCntr,
//               decoration: InputDecoration(
//                   hintText: 'Password'
//               ),
//             ),
//             SizedBox(height: 40,),
//             ElevatedButton(
//               onPressed: () async {
//                 List loginData = await loginAccount1(emailCntr.text, passwordCntr.text);
//                 if (loginData[0] == true) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (contex) => MainPage(),
//                     ),
//                   );
//                 }
//               },
//               child: Text('Login'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:lok/App/MainPage.dart';
// import 'package:lok/L&R/serverLogin.dart';
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//
//   // var mail = TextEditingController();
//   // var password = TextEditingController();
//
//   TextEditingController mail = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   void login(String mail ,String password) async {
//
//     try{
//
//       Response response = await post(
//           Uri.parse('https://reqres.in/api/login'),
//           body: {
//             "usernameOrEmail": mail,
//             "password": password,
//           }
//       );
//
//       if(response.statusCode == 200){
//
//         var data = jsonDecode(response.body.toString());
//         print(data['token']);
//         print('Login successfully');
//
//       } else {
//         print('failed');
//         print(response.statusCode);
//         print(mail.runtimeType);
//         print(password.runtimeType);
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: mail,
//               decoration: InputDecoration(
//                   hintText: 'Email'
//               ),
//             ),
//             SizedBox(height: 20,),
//             TextFormField(
//               controller: password,
//               decoration: InputDecoration(
//                   hintText: 'Password'
//               ),
//             ),
//             SizedBox(height: 40,),
//             ElevatedButton(
//                  child: Text('Login'),
//                   onPressed: () {
//                     login(mail.text.toString(), password.text.toString());
//                   },),
//                  // onPressed: () {
//                  //   login(emailController.text.toString(), passwordController.text.toString());
//                  // },
//             // ),
//             // GestureDetector(
//             //   onTap: (){
//             //     // login(emailController.text.toString(), passwordController.text.toString());
//             //     emailController.text = email;
//             //   },
//             //   child: Container(
//             //     height: 50,
//             //     decoration: BoxDecoration(
//             //         color: Colors.green,
//             //         borderRadius: BorderRadius.circular(10)
//             //     ),
//             //     child: Center(child: Text('Login'),),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:lok/App/MainPage.dart';
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//   TextEditingController usernameOrEmailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//             controller: usernameOrEmailController,
//         ),
//             TextFormField(
//               controller: passwordController,
//             ),
//             ElevatedButton(
//                 child: Text('Login'),
//                 onPressed: () {
//
//                 },
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }
