import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:moviecoo/Features/Movies/presentation/manger/movie_details_cubit.dart';
import 'package:moviecoo/Features/Movies/presentation/manger/movie_details_state.dart';
import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/utils/dim.dart';

import '../../data/model/MovieDetails.dart';

class WatchMovie extends StatelessWidget {
  const WatchMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WatchMovieBody());
  }
}

class WatchMovieBody extends StatefulWidget {
  const WatchMovieBody({
    Key? key,
  }) : super(key: key);

  @override
  State<WatchMovieBody> createState() => _WatchMovieBodyState();
}

class _WatchMovieBodyState extends State<WatchMovieBody> {


  @override
  void initState() {
BlocProvider.of<MovieDetailsCubit>(context).fetchData() ;
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: dimHeight(context) * 0.6,
                      child: Image.network(
                        "$imagePath${state.movie.backdropPath!}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: dimHeight(context) * 0.4,
                      width: dimWidth(context),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: mainColor.withOpacity(0.997),
                          spreadRadius: 100,
                          blurRadius: 40,
                          offset: const Offset(1, 2),
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              state.movie.overview!,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white54 , fontWeight: FontWeight.w100),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: myfButton(
                                  text: "Watch Now ",
                                  color: secondColor,
                                  width: dimWidth(context) ),
                            ),
                            mysButton(
                                width: dimWidth(context),
                                color: Colors.transparent,
                                text: "Add To Favourite"),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: dimHeight(context) * 0.4,
                  child: BlurryContainer(
                    blur: 3,
                    color: Colors.transparent,
                    width: dimWidth(context),
                    height: dimHeight(context) * 0.1,
                    borderRadius: BorderRadius.zero,
                    child: Column(

                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                "${state.movie.title!} ",
                                style: GoogleFonts.staatliches(fontSize: 20),
                              ),
                              const SizedBox(width: 4,) ,
                              Text(
                                state.movie.releaseDate!.substring(0, 4),
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Row(
mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 14,
                                ),

                                Text(
                                  state.movie.voteAverage!.toStringAsFixed(1),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(width: 4,) ,
                            Text(
                              "from ${state.movie.voteCount} people",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10 , fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is MovieDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget myfButton(
        {required Color color, required String text, required width}) =>
    Container(
      width: width,
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

Widget mysButton(
        {required Color color, required String text, required width}) =>
    Container(
      width: width,
      decoration:
          BoxDecoration(color: color, border: Border.all(color: secondColor)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

