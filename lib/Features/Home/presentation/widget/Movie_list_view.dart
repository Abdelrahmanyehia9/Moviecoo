import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviecoo/Features/Home/presentation/manger/home_states.dart';
import 'package:moviecoo/Features/Home/presentation/widget/movie_item.dart';

import '../manger/home_cubit.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMovieCubit, HomeState>(builder: (context, state) {
      if (state is HomeFailure) {
        print ('failure') ;

        return Center(child: Text(state.errorMessage));
      } else if (state is HomeSuccess) {
        print(state.model.length) ;
        print ('success') ;
      return Expanded(
        child:   ListView.builder(
          itemCount: state.model.length,
          itemBuilder: (context, index) => MovieItem(
            movieModel:  state.model.elementAt(index)   ,
          ),
        ),
      );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
