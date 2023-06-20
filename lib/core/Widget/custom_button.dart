import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Container(
      padding: const EdgeInsets.symmetric(horizontal: 36 , vertical: 8),
      decoration: BoxDecoration(boxShadow: [
      BoxShadow(
      color: const Color(0xffEC255A).withOpacity(0.5),
        spreadRadius: 4,
        blurRadius: 5,
        offset: const Offset(1, 2),)
      ],
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffEC255A),
      ),

      child: Text("Watch Now" , style: GoogleFonts.robotoCondensed(fontSize: 14 , fontWeight: FontWeight.bold),),

    ) ;
    ;
  }
}
