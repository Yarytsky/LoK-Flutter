import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/App/AccountPage.dart';
import 'package:lok/App/DiaryPage.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/proposal.dart';
import 'package:lok/constants/models/subject.dart';
import 'package:lok/constants/services/lokApiManager.dart';
import 'package:lok/constants/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

const List<String> courseList = <String>[
  'All Courses',
  'First',
  'Second',
  'Third',
  'Fourth'
];
const List<String> termList = <String>[
  'All term',
  '1',
  '2',
];

class ProposalPage extends StatefulWidget {
  const ProposalPage({Key? key}) : super(key: key);

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  List<Proposall> proposalsInfo = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    var popularMovies = await MoviesApiService().getProposal();
    setState(() {
      proposalsInfo.addAll(popularMovies);
    });
  }

  @override
  Widget build(BuildContext context) {
    Uint8List a(b) {
      Uint8List bytesImage = const Base64Decoder().convert(b);
      return bytesImage;
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: BaseAppBar(
            appBarText: 'Proposal',
          ),
        ),
        drawer: BaseDrawler(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: proposalsInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        launchUrlString('${proposalsInfo[index].link}');
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                        child: Container(
                          height: 175,
                          decoration: BoxDecoration(
                            color: Base30,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image.memory(
                                    a(proposalsInfo[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '${proposalsInfo[index].name}',
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: BaseBlack,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "${proposalsInfo[index].description}",
                                  overflow: TextOverflow.ellipsis,
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
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
