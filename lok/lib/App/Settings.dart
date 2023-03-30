import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:flutter/cupertino.dart';

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

    Fruit? _fruit = Fruit.man;
    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(),
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
                        "Profile",
                        style: GoogleFonts.sourceSansPro(
                            color: AdditionalBlue,
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Name Name",
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      title: Text('Man'),
                      leading: Radio<Fruit>(
                        value: Fruit.woman,
                        groupValue: _fruit,
                        onChanged: (Fruit? value) {
                          setState(() {
                            _fruit = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Woman'),
                      leading: Radio<Fruit>(
                        value: Fruit.man,
                        groupValue: _fruit,
                        onChanged: (Fruit? value) {
                          setState(() {
                            _fruit = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Other'),
                      leading: Radio<Fruit>(
                        value: Fruit.other,
                        groupValue: _fruit,
                        onChanged: (Fruit? value) {
                          setState(() {
                            _fruit = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //validator: emailValidator,
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
                DropdownButtonFormField<String>(
                  value: languageDropdownValue,
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
                      languageDropdownValue = value!;
                      print(languageDropdownValue);
                    });
                  },
                  items: languageList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
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