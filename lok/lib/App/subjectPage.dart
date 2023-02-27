import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/user.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {

  void getUserSubjects() async {
    var dio = Dio();
    var response = await dio.get(
        'https://localhost:7203/user/getuser/${userId}');
    final decoded = response.data as Map<String, dynamic>;
    final movie = Movie.fromJson(decoded);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: BaseAppBar(appBarText: 'Subjects',),
          ),
          drawer: BaseDrawler(),
          body: Column(
            children: [
              Container(
                height: 175,
                decoration: BoxDecoration(
                  color: Base30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(
                            'https://t4.ftcdn.net/jpg/03/21/43/07/360_F_321430761_qQi0CU9tzI5w1k1vJgdA02LMtXtsXvJE.jpg'),
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Mathematical analysis',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: BaseBlack,
                                ),
                              ),
                              Icon(CupertinoIcons.info)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Pub Nelya",
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Base90,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
