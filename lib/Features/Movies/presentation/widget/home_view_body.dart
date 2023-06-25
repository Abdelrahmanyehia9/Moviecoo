import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviecoo/constants.dart';
import '../manger/home_states.dart';
import '../manger/home_cubit.dart';
import 'Movie_list_view.dart';
import 'category_movie.dart';
import 'custom_appbar.dart';
import 'search_movie_text_feild.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children:   [
          const CustomAppBar()  ,
          const SearchMovieTextField() ,
          TabBar(indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,labelColor : const Color(0xffEC255A),
            labelStyle:  GoogleFonts.robotoCondensed(

              fontSize: 24, fontWeight: FontWeight.bold),
unselectedLabelStyle:  GoogleFonts.robotoCondensed(
              fontSize: 18, ),

            tabs: const [
            Tab(child: Text('movie')) ,
            Tab(child: Text("tv")) ,
            Tab(child: Text('Books'))          ],) ,
const SizedBox(height: 14,),
           const Expanded(
            child: TabBarView(children: [

              MovieListView() ,
              Center(child : Text('hi') )  ,
              Center(child : Text('bye') )  ,


            ]),
          ),
        ],
      ),
    );
  }
}
