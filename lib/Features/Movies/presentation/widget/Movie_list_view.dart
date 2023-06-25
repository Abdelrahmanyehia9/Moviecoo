import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviecoo/Features/Movies/presentation/manger/movie_details_cubit.dart';
import 'package:moviecoo/core/utils/app_router.dart';


import '../../../../core/utils/service_locator.dart';
import '../../data/repos/home_repo_impl.dart';
import '../manger/home_cubit.dart';
import '../manger/home_states.dart';
import 'movie_item.dart';

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
      return ListView.builder(
        itemCount: state.model.length,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            MovieDetailsCubit.id = state.model[index].id ;
            GoRouter.of(context).push(AppRouter.movieDetails) ;

          },
          child: MovieItem(
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
