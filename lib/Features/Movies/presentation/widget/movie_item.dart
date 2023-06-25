import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/Widget/custom_button.dart';
import 'package:moviecoo/core/utils/dim.dart';

import '../../data/model/result.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movieModel,
  }) : super(key: key);
  final Result movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        height: dimHeight(context) * 0.2,
        width: dimWidth(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                child: Image.network(
                  '$imagePath${movieModel.posterPath!}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movieModel.title!, textAlign: TextAlign.start, style: GoogleFonts.robotoCondensed(fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffF6C700),
                        size: 14,
                      ),
                      Text(
                        movieModel.voteAverage.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                      ),
                    ],
                  ),
                  Text(
                    '${movieModel.releaseDate!.substring(0,4)} |  ${movieModel.popularity!.round().toString()}',
                    style: GoogleFonts.robotoCondensed(fontSize: 12, fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(height: 12),

                  InkWell(onTap: (){
                    print('button Pressed') ;
                  },
                      child: const CustomButton())
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: (){
                  print("iconPressed") ;
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
