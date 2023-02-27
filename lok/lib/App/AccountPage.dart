import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/Reusable%20Widgets/BaseOvalImage.dart';
import 'package:lok/Reusable%20Widgets/Charts.dart';
import 'package:lok/Reusable%20Widgets/ProfileLineText.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:lok/constants/services/lokApiManager.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    var dio = Dio();
    var response = await dio.get(
        'https://localhost:7203/user/getuser/${userId}');
    final decoded = response.data as Map<String, dynamic>;
    final movie = Movie.fromJson(decoded);
    setState(() {
      movies.add(movie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGridView(),
    );
  }

  Widget _buildGridView() {
    if(movies.isEmpty){
      return Center(child: CircularProgressIndicator(),);
    } else {
      return FutureAppBuilder(movie: movies.first);
    }
  }
}

class FutureAppBuilder extends StatelessWidget {
  const FutureAppBuilder({Key? key, required this.movie,}) : super(key: key);
  final Movie movie;

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
                      Image(image: AssetImage('icons/PencilSimple.png')),
                    ],
                  ),
                ),
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
                            Text("${movie.firstName} ${movie.lastname}",
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
                        SizedBox(
                          height: 24,
                        ),
                        ProfileLineText(
                            TextOne: 'Phone Number: ',
                            TextTwo: '${movie.normalizedUserName}'),
                        ProfileLineText(
                            TextOne: 'Mail: ', TextTwo: '${movie.email}'),
                        ProfileLineText(
                            TextOne: 'Country: ', TextTwo: '${movie.country}'),
                        ProfileLineText(
                            TextOne: 'Gender: ', TextTwo: '${movie.gender}'),
                        ProfileLineText(TextOne: 'Absense: ', TextTwo: '${movie.attendance}'),
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
                          "Number% attendance",
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
                          "Number GPA",
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
