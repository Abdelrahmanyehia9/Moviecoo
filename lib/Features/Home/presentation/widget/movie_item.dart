import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviecoo/Features/Home/data/model/movie_model.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movieModel.backdropPath!}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movieModel.title!, textAlign: TextAlign.start, style: GoogleFonts.robotoCondensed(fontSize: 20, fontWeight: FontWeight.w600)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        '${movieModel.releaseDate}| ${movieModel.popularity.toString()}',
                        style: GoogleFonts.robotoCondensed(fontSize: 12, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  const CustomButton()
                ],
              ),
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.1),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
