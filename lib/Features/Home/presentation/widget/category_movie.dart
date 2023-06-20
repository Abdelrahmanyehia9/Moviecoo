import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'toggle_button.dart';

class CategoryMovie extends StatelessWidget {
  const CategoryMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: CustomToggleButton()
      ),
    );
  }
}

Widget nonActiveButton(String text) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 14.0),
  child:   Text(

        text,

        style: GoogleFonts.robotoCondensed(
            fontSize: 18, fontWeight: FontWeight.bold),

      ),
);



