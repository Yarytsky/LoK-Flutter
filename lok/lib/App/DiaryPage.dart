import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDiveder.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/lection.dart';
import 'package:lok/constants/models/subject.dart';
import 'package:lok/constants/services/lokApiManager.dart';
import 'package:lok/constants/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DiaryPage extends StatefulWidget {
  final String name;
  final String description;
  final String id;
  final String image;

  const DiaryPage({
    Key? key,
    required this.name,
    required this.description,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  List<Subject> sunjectInfo = [];
  List<Lection> lectionInfo = [];

  @override
  void initState() {
    super.initState();
    getUserInfo();
    _loadMovies();
  }

  void getUserInfo() async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/subject/getsubjectbyid/${widget.id}',
      options: Options(headers: {
        'Authorization': 'Bearer $accesstoken',
      }),
    );
    print(response.statusCode);
    final decoded = response.data['subject'] as Map<String, dynamic>;
    final user = Subject.fromJson(decoded);
    setState(() {
      sunjectInfo.add(user);
    });
  }

  void _loadMovies() async {
    var popularMovies = await MoviesApiService().getLection(widget.id);
    setState(() {
      lectionInfo.addAll(popularMovies);
    });
  }

  Widget build(BuildContext context) {
    return _buildGridView();
  }

  Widget _buildGridView() {
    if (sunjectInfo.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return FutureDiaryBuilder(
        subaru: sunjectInfo.first,
        toyota: lectionInfo,
      );
    }
  }
}

class FutureDiaryBuilder extends StatelessWidget {
  const FutureDiaryBuilder(
      {Key? key, required this.subaru, required this.toyota})
      : super(key: key);
  final Subject subaru;
  final List<Lection> toyota;

  @override
  Widget build(BuildContext context) {
    final double Attendance = 70;
    final double AttendanceTo100 = Attendance * 0.01;
    final double Grade = 15;
    final double GradeTo100 = Grade * 0.01;
    final double fackItAll = (((Grade + Attendance * 0.5) / 2) * 0.42 * 3) / 4;
    final double fackItAllTo100 =
        ((((Grade + Attendance) / 2) * 0.42 + 18) / 4) * 0.1;

    Uint8List a(b) {
      Uint8List bytesImage = const Base64Decoder().convert(b);
      return bytesImage;
    }

    Color selectColorGeneral(){
      if(fackItAllTo100 <= 0.25){
        return Colors.red;
      } else if (fackItAllTo100 >= 0.75){
        return Colors.green;
      } else{
        return Colors.yellow;
      }
    }

    Color selectColorGrade(){
      if(GradeTo100 <= 0.25){
        return Colors.red;
      } else if (GradeTo100 >= 0.75){
        return Colors.green;
      } else{
        return Colors.yellow;
      }
    }

    Color selectColorAttendaance(){
      if(AttendanceTo100 <= 0.25){
        return Colors.red;
      } else if (AttendanceTo100 >= 0.75){
        return Colors.green;
      } else{
        return Colors.yellow;
      }
    }

    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: PrimaryPurple5,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: BaseAppBar(
              appBarText: '',
            ),
          ),
          drawer: BaseDrawler(),
          body: Column(
            children: [
              Image.memory(
                a(subaru.image),
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                color: BaseWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '${subaru.name}',
                            style: sourcesansprostyle24w600BB,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '${subaru.teacher}',
                            style: sourcesansprostyle16w400B90,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.info_outline,size: 32,),
                    ),
                  ],
                ),
              ),
              Text('Your statustucs', style: sourcesansprostyle24w600BB,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'General',
                            style: sourcesansprostyle20w600BB,
                          ),
                        ),
                        CircularPercentIndicator(
                          progressColor: selectColorGeneral(),
                          radius: 44.5,
                          lineWidth: 18.0,
                          percent: fackItAllTo100,
                          center: Text(
                            '${fackItAll}',
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Grade',
                          style: sourcesansprostyle20w600BB,
                        ),
                      ),
                      CircularPercentIndicator(
                        progressColor: selectColorGrade(),
                        radius: 44.5,
                        lineWidth: 18.0,
                        percent: GradeTo100,
                        center: Text(
                          '${Grade}',
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Attendance',
                          style: sourcesansprostyle20w600BB,
                        ),
                      ),
                      CircularPercentIndicator(
                        progressColor: selectColorAttendaance(),
                        radius: 44.5,
                        lineWidth: 18.0,
                        percent: AttendanceTo100,
                        center: Text(
                          '${Attendance}%',
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: toyota.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          launchUrlString('${toyota[index].link}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Base30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${toyota[index].name}',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: BaseBlack,
                                      ),
                                    ),
                                    Text(
                                      "${toyota[index].description}",
                                      style: sourcesansprostyle20w600BB,
                                    ),
                                    Text('Tap to get more info...'),
                                    BaseDivider(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
