import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lok/Reusable%20Widgets/proposalCompanyName.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/dataCarousel.dart';

import '../Reusable Widgets/BaseAppBar.dart';
import '../Reusable Widgets/BaseDrawler.dart';

class Proposal extends StatelessWidget {
  const Proposal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: BaseAppBar(appBarText: 'Proposal',),
          ),
          drawer: BaseDrawler(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                proposalCompanyName(name: 'SoftServe',),
                tempCarousel(),
                proposalCompanyName(name: 'Sigma Software',),
                tempCarousel(),
                proposalCompanyName(name: 'Eleks',),
                tempCarousel(),
                proposalCompanyName(name: 'Epam',),
                tempCarousel(),
                proposalCompanyName(name: 'Private Company',),
                tempCarousel(),
              ],
            ),
          ),
      )
    );
  }
}

class tempCarousel extends StatelessWidget {
  const tempCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIdx) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
          child: Container(
            height: 175,
            decoration: BoxDecoration(
              color: Base30,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      names[index],
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: BaseBlack,
                      ),
                    ),
                    Text(desc[index],
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Base90,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
      ),
    );
  }
}
