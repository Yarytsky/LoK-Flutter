import 'package:dio/dio.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/subject.dart';
import 'package:lok/constants/services/lokApiManager.dart';
import 'package:lok/constants/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DiaryPage extends StatefulWidget {
  final String name;
  final String description;
  final String id;

  const DiaryPage({Key? key, required this.name, required this.description, required this.id})
      : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override

  List<Subject> sunjectInfo = [];

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/subject/getsubjectbyid/${widget.id}',
      options: Options(
          headers: {
            'Authorization' : 'Bearer $accesstoken',
          }
      ),
    );
    print(response.statusCode);
    final decoded = response.data['subject'] as Map<String, dynamic>;
    final user = Subject.fromJson(decoded);
    setState(() {
      sunjectInfo.add(user);
    });
  }

  Widget build(BuildContext context) {
    return _buildGridView();
  }
  Widget _buildGridView() {
    if(sunjectInfo.isEmpty){
      return Center(child: CircularProgressIndicator());
    } else{
      return FutureDiaryBuilder(subaru: sunjectInfo.first);
    }
  }
}
class FutureDiaryBuilder extends StatelessWidget {
  const FutureDiaryBuilder({Key? key, required this.subaru}) : super(key: key);
  final Subject subaru;

  @override
  Widget build(BuildContext context) {
    final double Attendance = 70;
    final double AttendanceTo100 = Attendance*0.01;
    final double Grade = 15;
    final double GradeTo100 = Grade*0.01;
    final double fackItAll = (((Grade + Attendance*0.5)/2)*0.42*3)/4;
    final double fackItAllTo100 = ((((Grade + Attendance)/2)*0.42+18)/4)*0.1;
    return FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
      return SafeArea(
        child: Scaffold(
          backgroundColor: Base20,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: BaseAppBar(
              appBarText: '',
            ),
          ),
          drawer: BaseDrawler(),
          body: Column(
            children: [
              Center(
                child: Image(
                  image: NetworkImage(
                      'https://t3.ftcdn.net/jpg/03/66/54/56/360_F_366545675_F8yauzlroVONS25PuOP0oT1z5YRFxO63.jpg'),
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('${subaru.name}', style: sourcesansprostyle20w600BB,),
                        Text('${subaru.teacher}', style: sourcesansprostyle16w400B90,),
                      ],
                    ),
                    Icon(Icons.info_outline),
                  ],
                ),
              ),
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
                          child: Text('General', style: sourcesansprostyle20w600BB,),
                        ),
                        CircularPercentIndicator(
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
                        child: Text('Grade', style: sourcesansprostyle20w600BB,),
                      ),
                      CircularPercentIndicator(
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
                        child: Text('Attendance', style: sourcesansprostyle20w600BB,),
                      ),
                      CircularPercentIndicator(
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
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        child: Container(
                          height: 175,
                          decoration: BoxDecoration(
                            color: Base30,
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
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
                                      'Theme 1: Occasional Events',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: BaseBlack,
                                      ),
                                    ),
                                    Text(
                                      "Lecture ",
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Base90,
                                      ),
                                    ),
                                    Text(
                                      "Practice",
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Base90,
                                      ),
                                    ),
                                    Text(
                                      "Video",
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Base90,
                                      ),
                                    ),
                                    Text(
                                      "Homework",
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Base90,
                                      ),
                                    ),
                                    Text(
                                      'Test',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Base70,
                                      ),
                                    ),
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
