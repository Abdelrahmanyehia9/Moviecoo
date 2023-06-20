import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviecoo/Features/Home/presentation/widget/Movie_list_view.dart';
import '../manger/home_states.dart';
import '../manger/home_cubit.dart';
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
          const CategoryMovie() ,
           MovieListView()
        ],
      ),
    );
  }
}
