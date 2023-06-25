import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moviecoo/Features/Movies/presentation/manger/movie_details_cubit.dart';
import 'package:moviecoo/Features/auth/presentation/view/auth_view.dart';
import 'package:moviecoo/Features/favourite/presentation/view/favorite_view.dart';

import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/utils/dim.dart';

import '../../../../core/utils/app_router.dart';
import '../../data/model/result.dart';
import '../widget/continou_watching.dart';
import '../widget/home_view_body.dart';
import '../widget/newest_list.dart';
import '../widget/popular_movies.dart';

class StreamReview extends StatefulWidget {
  @override
  State<StreamReview> createState() => _StreamReviewState();
}

class _StreamReviewState extends State<StreamReview> {
  List<Color> myColor = [secondColor, Colors.white];

  int pIndex = 0  ;

List<Widget> pages = [const StreamReviewBody() , const HomeViewBody() , const MyFavouriteView() , const AuthView() ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        body: pages[pIndex] ,
        bottomNavigationBar: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          onTabChange: (index){
           setState(() {
             pIndex = index ;
           });
          },
          activeColor: secondColor,
          iconSize: 18,
          style: GnavStyle.google,
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: "Home",
              gap: 8,
            ),
            GButton(
              icon: Icons.movie_creation_outlined,
              text: "Watch",
              gap: 8,
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Saved",
              gap: 8,
            ),
            GButton(
              icon: Icons.person_outline,
              text: "Profile",
              gap: 8,
            )
          ],
        ),
      ),
    );
  }
}

class StreamReviewBody extends StatelessWidget {
  const StreamReviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Continue",
                    style: GoogleFonts.staatliches(
                        color: secondColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\t Watching",
                    style: GoogleFonts.staatliches(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 16,) ,
              const ContinuoWatching() ,
              const SizedBox(
                height: 16,
              ),
              const PopularMovies() ,
              const NewestMovies()
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImage extends StatelessWidget {
  const MovieImage({Key? key, required this.movieModel}) : super(key: key);
final Result movieModel  ;
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        MovieDetailsCubit.id = movieModel.id;
        GoRouter.of(context).push(AppRouter.movieDetails) ;

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network("$imagePath${movieModel.posterPath}" , width: dimWidth(context)*0.25, fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
