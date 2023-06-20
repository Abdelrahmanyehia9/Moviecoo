import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/utils/dim.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        image: DecorationImage(
            image: AssetImage(logoImage ,),fit: BoxFit.cover
        ),
      ),
      width: dimWidth(context),
      height: dimHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Moviecoo",
            textAlign: TextAlign.center,
            style: GoogleFonts.romanesco(fontSize: 96),
          ),
          Text(
            "watch and find movie that\n bring your mood back",
            textAlign: TextAlign.center,
            style: GoogleFonts.staatliches(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
