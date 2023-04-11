import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:lok/constants/indus.dart';
import 'package:lok/constants/models/user.dart';
import 'package:lok/constants/services/lokApiManager.dart';

const List<String> languageList = <String>['English', 'Ukr', 'Other'];
const List<String> countryList = <String>['Ukraine', 'United Kingdom', 'Poland'];

enum Fruit { woman, man, other}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    String? languageDropdownValue = languageList.first;
    String? counrtyDropdownValue = countryList.first;

    TextEditingController emailController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController countryController = TextEditingController();

    List<User> userInfo = [];

    void updateUserInfo() async {
      var dio = Dio();
      var response = await dio.put("${MoviesApiService().dio.options.baseUrl}/user/updateuser",
        options: Options(
            headers: {
              'Authorization' : 'Bearer $accesstoken',
            }
        ),
        data: {
          'id': userId,
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          'email': emailController.text,
          'gender': genderController.text,
          "country": countryController.text,
        },
      );
      print(response.data);
      print(response.statusCode);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(appBarText: 'Profile',),
        ),
        drawer: BaseDrawler(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My profile",
                        style: GoogleFonts.sourceSansPro(
                            color: BaseBlack,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                      Image(image: AssetImage('icons/PencilSimple.png')),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Divider()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BaseOvalImg(
                      width: 120,
                      height: 120,
                      borderWidth: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("$firstName $lastName",
                                style: GoogleFonts.sourceSansPro(
                                    color: BaseBlack,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              '(Student)',
                              style: GoogleFonts.sourceSansPro(
                                color: Base50,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'IT STEP Університет',
                          style: GoogleFonts.sourceSansPro(
                            color: Base70,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '3 term (2 course)',
                          style: GoogleFonts.sourceSansPro(
                            color: Base50,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.emailAddress,
                    //validator: emailValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'First Name',
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
                    controller: lastNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Last Name',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(CupertinoIcons.person),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: genderController,
                    keyboardType: TextInputType.emailAddress,
                    //validator: emailValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Gender',
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
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: emailController,
                    validator: emailValidator,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    maxLength: 20,
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
                    controller: countryController,
                    keyboardType: TextInputType.emailAddress,
                    //validator: emailValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      hintText: 'Country',
                      hintStyle: GoogleFonts.sourceSansPro(),
                      prefixIcon: Icon(CupertinoIcons.person),
                      // errorText: alfa,
                    ),
                  ),
                ),
                // DropdownButtonFormField<String>(
                //   value: counrtyDropdownValue,
                //   icon: const Icon(Icons.arrow_drop_down_rounded),
                //   dropdownColor: Color(0xFFCECECE),
                //   elevation: 16,
                //   style: const TextStyle(color: Color(0xFF676767)),
                //   decoration: InputDecoration(
                //     enabledBorder: InputBorder.none,
                //     prefixIcon: Icon(CupertinoIcons.placemark),
                //   ),
                //   onChanged: (String? value) {
                //     setState(() {
                //       counrtyDropdownValue = value!;
                //       print(counrtyDropdownValue);
                //     });
                //   },
                //   items: countryList.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // DropdownButtonFormField<String>(
                //   value: languageDropdownValue,
                //   icon: const Icon(Icons.arrow_drop_down_rounded),
                //   dropdownColor: Color(0xFFCECECE),
                //   elevation: 16,
                //   style: const TextStyle(color: Color(0xFF676767)),
                //   decoration: InputDecoration(
                //     enabledBorder: InputBorder.none,
                //     prefixIcon: Icon(CupertinoIcons.placemark),
                //   ),
                //   onChanged: (String? value) {
                //     setState(() {
                //       languageDropdownValue = value!;
                //       print(languageDropdownValue);
                //     });
                //   },
                //   items: languageList.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    updateUserInfo();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40,
                    decoration: BoxDecoration(
                      color: PrimaryPurple1,
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    ),
                    child: Align(alignment: Alignment.center,child: Text("Save", style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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