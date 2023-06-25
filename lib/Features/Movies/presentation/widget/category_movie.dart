import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryMovie extends StatefulWidget {
  const CategoryMovie({super.key});

  @override
  State<CategoryMovie> createState() => _CategoryMovieState();
}

class _CategoryMovieState extends State<CategoryMovie>  with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,

        tabs: [

      Tab(child: nonActiveButton('romance')),
      Tab(child: nonActiveButton('war')),
      Tab(child: nonActiveButton('action')),
      Tab(child: nonActiveButton('comedy')),
      Tab(child: nonActiveButton('adults'))

    ]);
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



