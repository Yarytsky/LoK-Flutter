import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/App/Settings.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:lok/Reusable%20Widgets/Charts.dart';
import 'package:lok/Reusable%20Widgets/ProfileLineText.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/userSave.dart';
import 'package:lok/constants/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:lok/constants/services/lokApiManager.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  List<User> userInfo = MoviesApiService().userInfo;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }




  void getUserInfo() async {
    var dio = Dio();
    var response = await dio.get(
        '${MoviesApiService().dio.options.baseUrl}/user/getuser/${userId}',
      options: Options(
        headers: {
          'Authorization' : 'Bearer $accesstoken',
        }
      ),
    );
    print(response.statusCode);
    final decoded = response.data['user'] as Map<String, dynamic>;
    final user = User.fromJson(decoded);
    setState(() {
      userInfo.add(user);
    });
    gender = user.gender;
    country = user.country;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGridView(),
    );
  }

  Widget _buildGridView() {
    if(userInfo.isEmpty){
      return Center(child: CircularProgressIndicator());
    } else{
      return FutureAppBuilder(user: userInfo.first);
    }
  }
}

class FutureAppBuilder extends StatelessWidget {
  const FutureAppBuilder({Key? key, required this.user,}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          backgroundColor: BaseWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: BaseAppBar(
              appBarText: 'Profile',
            ),
          ),
          drawer: BaseDrawler(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                    ],
                  ),
                ),
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
                            Text("${user.firstName} ${user.lastname}",
                                style: GoogleFonts.sourceSansPro(
                                    color: BaseBlack,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              '(${user.role})',
                              style: GoogleFonts.sourceSansPro(
                                color: Base50,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ProfileLineText(
                            TextOne: 'Phone Number: ',
                            TextTwo: '${user.normalizedUserName}'),
                        ProfileLineText(
                            TextOne: 'Mail: ', TextTwo: '${user.email}'),
                        ProfileLineText(
                            TextOne: 'Country: ', TextTwo: '${user.country}'),
                        ProfileLineText(
                            TextOne: 'Gender: ', TextTwo: '${user.gender}'),
                        ProfileLineText(TextOne: 'Absense: ', TextTwo: '${user.attendance}'),
                      ],
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    child: Text(
                      'Attendence chart',
                      style: GoogleFonts.sourceSansPro(
                        color: BaseBlack,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                        child: Text(
                          "80% attendance",
                          style: GoogleFonts.sourceSansPro(
                              color: AdditionalBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ))),
                LineChartSample2(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    child: Text(
                      'Progress',
                      style: GoogleFonts.sourceSansPro(
                        color: BaseBlack,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                        child: Text(
                          "10 GPA",
                          style: GoogleFonts.sourceSansPro(
                              color: AdditionalBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ))),
                LineChartSample2(),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<Uint8List> imageToByteArray(String imagePath) async {
  final file = File(imagePath);
  return await file.readAsBytes();
}

class ImageFromByteArray extends StatelessWidget {
  final String imagePath;

  ImageFromByteArray({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: imageToByteArray(imagePath),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
